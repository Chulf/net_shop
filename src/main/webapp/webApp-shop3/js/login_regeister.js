$(function(){
	getVerificationCode();
	// 登录
	$("#btnLogin").on("touchend",function(){
		var username = $("#iptEmail").val();
		var pwd = $("#iptPwd").val();
		$.ajax({
			url: getHostName()+'/user/login',
			type: 'POST',
			dataType: 'text',
			timeout:10000,
			data: {
				username: username,
				password: pwd
			},
			success:function(data){
				if(data == "success"){
					window.location.href = "home.jsp";
				}else{
                    alert("The account or password you entered is incorrect！")
                }
			}
		})
	})

	/**
	 * 获取验证码
	 * @return {[type]} [description]
	 */
	function getVerificationCode(){
		console.log()
		var srcVal = getHostName()+"/code/getCode?"+(new Date()).getTime();
		$("#VerCode").attr('src', srcVal);
	}

	$("#VerCode").on("touchend",function(){
		getVerificationCode();
	})


	// 检测用户名
	$("#iptUsername").blur(function () {
	    var  username = $("#iptUsername").val()
		$.ajax({
            url :  getHostName()+"/user/checkUsername",
            data :  {"username":username},
            type : "post",
            success :  function (result) {
                if(username.trim()==""){
                    $(".errorUsername").text("Username can not be empty")
                }else{
                    if(result=="success") {
                        $(".errorUsername").html("<font  color = 'green'>Congratulations, the user name can be used</font>")
                    }else{
                        $(".errorUsername").text("User name already used")
                    }
                }
            }
        })
    })

    // 邮箱检测
    $("#iptEmail").blur(function () {
	    var   mail   =   $("#iptEmail").val()
	    if(mail.trim()!=""){
	        var corr = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/
			if(!corr.test(mail)){
				$(".errorEmail").text("Bad mailbox format")
			}else{
	            $(".errorEmail").empty()
			}
		}else{
	        $(".errorEmail").empty()
		}
	})

    // 密码
    $("#iptPwd").blur(function () {
        if($("#iptPwd").val().trim()==""){
			$(".errorPwd").text("Password can not be blank")
        }else{
            $(".errorPwd").empty()
		}
    })

   $("#iptConfirmPwd").blur(function () {
         if($("#iptConfirmPwd").val()!=$("#iptPwd").val()){
            $(".errorConfirmPwd").text("Two passwords are inconsistent")
         }else{
             $(".errorConfirmPwd").empty()
		 }
    })

   // 手机号码
    $("#iptTel").blur(function () {
        var myreg=/^[0-9][0-9][0-9]{8,10}$/;
        if($("#iptTel").val().trim()==""){
            $(".errorTel").text("Phone number can not be empty")
        }else{
            if(!myreg.test($("#iptTel").val())){
                $(".errorTel").text("Mobile phone number is illegal")
			}else{
                $(".errorTel").html("<font color = 'green'>Mobile phone number is legal</font>")
			}
		}
    })

    // 验证码
    $("#iptCode").blur(function () {
            var   validate   =   $("#iptCode").val()
            $.ajax({
                url :  getHostName()+"/code/validateCheck",
                data :  {"validate":validate},
                type : "post",
                success :  function (result) {
                    if(result=="success"){
                        $(".errorCode").empty()
                    }else{
                        $(".errorCode").text("Verification code error");
                    }
                }
            })
    })

    $("#btnRegeister").click(function () {
        if($("#iptCode").val().trim()==""){
            alert("Please enter verification code\n!")
			return false
		}else{
        var  flag = true
        $("#iptUsername").blur()
		$("#iptPwd").blur()
        $("#iptConfirmPwd").blur()
		$("#iptTel").blur()
        var  utip =  $(".errorUsername").text()
		var  ptip = $(".errorPwd").text()
        var retip = $(".errorConfirmPwd").text()
        var teltip = $(".errorTel").text()
		var mailtip = $(".errorEmail").text()

		if(utip!="Congratulations, the user name can be used"){
			flag =false
		}
        if(ptip!=""){
            flag =false
        }
        if(retip!=""){
            flag =false
        }
        if(teltip!="Mobile phone number is legal"){
            flag =false
        }
        if(mailtip!=""){
            flag =false
		}

        if(flag == true){
        $("#iptCode").blur()
		var  tips = 	check()
		if(tips==""){
        var  username =  $("#iptUsername").val()
        var  password =  $("#iptPwd").val()
        var  tel =  $("#iptTel").val()
		var  email = $("#iptEmail").val()
        $.ajax({
            url :  getHostName()+"/user/register",
            data :  {"username":username,"password":password,"phone":tel,"email":email},
            type : "post",
            success :  function (result) {
            	if(result === "success"){
            		$(".regeister").empty().html("Registration success");
            		setTimeout(function(){
            			window.location.href = "home.jsp";
            		},3000);
            	}
            }
        })}else{
		    alert("Please enter correct verify code")
        }
        }else{
        	alert("You have entered an error, please check the input")
        }
        }
        })

    function  check(){
        var tips = $("#iptCode").text()
        return tips;
    }

})