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
                    alert("L'account o la password che hai inserito è sbagliato!")
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
                    $(".errorUsername").text("Il nome utente non può essere vuoto")
                }else{
                    if(result=="success") {
                        $(".errorUsername").html("<font  color = 'green'>Congratulazioni, il nome utente può essere utilizzato</font>")
                    }else{
                        $(".errorUsername").text("Nome utente già utilizzato")
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
				$(".errorEmail").text("Formato della casella di posta non valido")
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
			$(".errorPwd").text("La password non può essere vuota")
        }else{
            $(".errorPwd").empty()
		}
    })

   $("#iptConfirmPwd").blur(function () {
         if($("#iptConfirmPwd").val()!=$("#iptPwd").val()){
            $(".errorConfirmPwd").text("Due password sono incoerenti")
         }else{
             $(".errorConfirmPwd").empty()
		 }
    })

   // 手机号码
    $("#iptTel").blur(function () {
        var myreg=/^[0-9][0-9][0-9]{8,10}$/;
        if($("#iptTel").val().trim()==""){
            $(".errorTel").text("Il numero di telefono non può essere vuoto")
        }else{
            if(!myreg.test($("#iptTel").val())){
                $(".errorTel").text("Il numero di cellulare è illegale")
			}else{
                $(".errorTel").html("<font color = 'green'>Il numero di cellulare è legale</font>")
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
                        $(".errorCode").text("Errore del codice di verifica");
                    }
                }
            })
    })

    $("#btnRegeister").click(function () {
        if($("#iptCode").val().trim()==""){
            alert("Si prega di inserire il codice di verifica!")
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

		if(utip!="Congratulazioni, il nome utente può essere utilizzato"){
			flag =false
		}
        if(ptip!=""){
            flag =false
        }
        if(retip!=""){
            flag =false
        }
        if(teltip!="Il numero di cellulare è legale"){
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
            		$(".regeister").empty().html("Registrazione riuscita");
            		setTimeout(function(){
            			window.location.href = "home.jsp";
            		},3000);
            	}
            }
        })}else{
		    alert("Si prega di inserire il codice di verifica corretto")
        }
        }else{
        	alert("Hai inserito un errore, controlla l'input")
        }
        }
        })

    function  check(){
        var tips = $("#iptCode").text()
        return tips;
    }

})