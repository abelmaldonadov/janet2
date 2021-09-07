/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = new Vue({
    el: "#app",
    data: {
        user: {},
        info: {},
        
        arrProviders: [],
        provider: {}
    },
    methods: {
        providerGet(item){
            Mandarina.spinnerShow()
            fetch("providersApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.provider = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        providerGetAll(){
            Mandarina.spinnerShow()
            fetch("providersApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => this.arrProviders = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        providerInsert(){
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("provider", JSON.stringify(this.provider))
            
            fetch("providersApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.providerGetAll())
        },
        providerUpdate() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("provider", JSON.stringify(this.provider))
            
            fetch("providersApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.providerGetAll())
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
        .catch(() => Mandarina.error({text:"Se perdió la comunicación con el servidor"}))
    }
})
