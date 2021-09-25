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
        
        arrVendors: [],
        vendor: {}
    },
    methods: {
        vendorGet(item){
            Mandarina.spinnerShow()
            fetch("vendorsApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.vendor = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        vendorGetAll(){
            Mandarina.spinnerShow()
            fetch("vendorsApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => this.arrVendors = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        vendorInsert(){
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("vendor", JSON.stringify(this.vendor))
            
            fetch("vendorsApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.vendorGetAll())
        },
        vendorUpdate() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("vendor", JSON.stringify(this.vendor))
            
            fetch("vendorsApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.vendorGetAll())
        },
        vendorDelete() {},
        vendorSearch() {},
        
        
        clearForm() {
            this.vendor = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrVendors10Comp() {
            let arrReverse = this.arrVendors.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        },
        arrMeritComp() {
            arrMerit = []
            for (let item of this.arrVendors) {
                if (item.merit == "1") arrMerit.push(item)
            }
            return arrMerit
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.vendorGetAll()
        })
        .catch(() => Mandarina.error({text:"Se perdió la comunicación con el servidor"}))
    }
})
