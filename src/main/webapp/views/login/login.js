/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = new Vue({
    el: "#app",
    data: {
        user: "",
        password: ""
    },
    methods: {
        login() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("user", this.user),
            data.append("password", this.password)
            fetch("login", {method:"post", body:data})
            .then(response => {
                if (response.ok) location.href = "home"
                else Mandarina.error({text:"Usuario o contraseña incorrectos"})
            })
            .finally(() => Mandarina.spinnerHide())
        }
    }
})
