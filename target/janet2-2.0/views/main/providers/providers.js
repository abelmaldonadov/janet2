/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = new Vue({
    el: "#app",
    data: {
        spinner: '#gajo-spinner',
        user: {},
        info: {},
        
        arrProviders: [],
        provider: {}
    },
    methods: {
        providerGet(item){
            show(this.spinner)
            fetch("providersApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.provider = json)
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        providerGetAll(){
            show(this.spinner)
            fetch("providersApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => this.arrProviders = json)
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        providerInsert(){
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("provider", JSON.stringify(this.provider))
            
            fetch("providersApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.providerGetAll())
        },
        providerUpdate() {
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("provider", JSON.stringify(this.provider))
            
            fetch("providersApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.providerGetAll())
        },
        providerDelete() {},
        providerSearch() {},
        
        
        clearForm() {
            this.provider = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrProviders10Comp() {
            let arrReverse = this.arrProviders.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        },
        arrBlacklistComp() {
            arrBlacklist = []
            for (let item of this.arrProviders) {
                if (item.blacklist == "1") arrBlacklist.push(item)
            }
            return arrBlacklist
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.providerGetAll()
        })
        .catch(() => sayError({text:"Se perdió la comunicación con el servidor"}))
    }
})
