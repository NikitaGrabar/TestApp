//
//  ManagerProduct.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 17.10.23.
//

import Foundation
import UIKit


class ManagerProduct {
    
    static let shared = ManagerProduct()
    private init() {}
    
    var menuItem: [MenuItem] = [
        MenuItem(id: UUID().uuidString, icon: UIImage(named: "cheese")!, title: "Домашние сырные палочки", ingridient: ["Сыр твердый":"300 г","Яйцо":"1 шт.","Мука":"30 г","Масло растительное":"70 мл"], description: "Простой, но очень вкусный рецепт домашних сырных палочек. Пальчики оближешь! Минимум продуктов и максимум удовольствия, а с приготовлением справится даже ребёнок."),
        MenuItem(id: UUID().uuidString, icon: UIImage(named: "draniki")!, title: "Картофельные драники", ingridient: ["Картофель":"11 шт.","Яйца":"2 шт.","Соль":"по вкусу","Перец молотый":"по вкусу","Масло растительное":"для жарки"], description: "Очень простой и быстрый рецепт картофельных драников (дерунов)."),
        MenuItem(id: UUID().uuidString, icon: UIImage(named: "pizza")!, title: "Mини-пиццы", ingridient: ["Батон":"6-8 ломтиков","Колбаса (вареная и копчёная)":"150 г","Помидор":"1 шт.","Сыр":"100 г","Укроп свежий":"1 пучок"], description: "Рецепт горячих бутербродов очень простой. Приготовьте вкуснейшие мини-пиццы с колбасой, сыром и помидорами - вы не пожалеете."),
        MenuItem(id: UUID().uuidString, icon: UIImage(named: "cake")!, title: "Хоткейки", ingridient: ["Молоко":"200 мл","Яйца":"2 шт.","Сахар":"80 г","Мука пшеничная":"240 г","Разрыхлитель":"7 г"], description: "Хоткейки - вариант известных американских панкейков, но готовятся без масла. Оно не добавляется ни в тесто, ни на сковороду при жарке. Лёгкие, пористые оладьи на молоке отлично подойдут для завтрака."),
        MenuItem(id: UUID().uuidString, icon: UIImage(named: "convert")!, title: "Яичные конвертики с сыром и ветчиной", ingridient: ["Яйца":"4 шт.","Ветчина":"130 г","Сыр твёрдый":"100 г","Масло растительное (для жарки)":"1-2 ч. ложки","Петрушка свежая":"1 веточка"], description: "Сытное и вкусное блюдо (с изюминкой), которое можно приготовить всего из 3 ингредиентов, - аппетитные, нежные и румяные яичные конвертики с ветчиной и сыром. Отличная альтернатива привычной яичнице для завтрака или перекус на скорую руку. Попробуйте!")]
    
    
    func addItem(_ item: MenuItem) {
        menuItem.append(item)
    }
    
    func removeItem(id: String) {
        for (index,item) in menuItem.enumerated() {
            if item.id == id {
                menuItem.remove(at: index)
            }
        }
    }
}
