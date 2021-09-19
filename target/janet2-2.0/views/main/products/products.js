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
        
        arrProducts: [],
        product: {},
        
        arrCosts: [],
        cost: {}
    },
    methods: {
        productGet(item){
            Mandarina.spinnerShow()
            this.clearForm()
            fetch("productsApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.product = json
                this.arrCosts.forEach(cost => {
                    if (cost.productId == this.product.id && cost.selected == "1") this.cost = cost
                })
            })
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        productGetAll(){
            Mandarina.spinnerShow()
            fetch("productsApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.arrProducts = json.arrProducts
                this.arrCosts = json.arrCosts
            })
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        productInsert(){
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("product", JSON.stringify(this.product))
            
            fetch("productsApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.productGetAll())
        },
        productUpdate() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("product", JSON.stringify(this.product))
            
            fetch("productsApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.productGetAll())
        },
        productDelete() {},
        productSearch() {},
        
        
        costInsert() {
            Mandarina.spinnerShow()
            this.cost.productId = this.product.id
            let data = new URLSearchParams()
            data.append("cost", JSON.stringify(this.cost))
            
            fetch("costsApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.productGetAll())
        },
        
        
        clearForm() {
            this.product = {}
            this.cost = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrProducts10Comp() {
            let arrReverse = this.arrProducts.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        },
        ArrCostsForProductComp() {
            let arrCosts = []
            this.arrCosts.forEach(cost => {
                if (cost.productId == this.product.id) arrCosts.push(cost) 
            })
            return arrCosts
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.productGetAll()
        })
        .catch(() => Mandarina.error({text:"Se perdió la comunicación con el servidor"}))
    }
})
