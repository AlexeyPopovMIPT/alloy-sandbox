/*sig Bus 
{
    driver: Driver,
    passengers: set Passenger
}

// passengers = [ (Bus0, Passenger0), (Bus0, Passenger1) ] 
sig Driver {}
sig Passenger {}

fact 
{
    all disj b1, b2: Bus | no b1.passengers & b2.passengers
}*/


// Попытаться найти проблемы, нарушающие
// это условие
/*check 
{
    all b1, b2: Bus | all p: Passenger | 
    (p in b1.passengers and b1 != b2) implies 
    {
        p not in b2.passengers
    }
} for 3 but 10 Passenger*/
/*
abstract sig // абстрактная сигнатура, используется только для расширения
Person
{
    father: lone Man,
    mother: lone Woman // less than or equal one
}

sig Man extends Person
{
    wife: lone Woman
}

sig Woman extends Person
{
    husband: lone Man
}

fact Biology
{
    no p: Person | p in p.^(mother + father)
    // ^ - транзитивное замыкание:
    // p1, p2; p2, 3 -> p1, p3
}
fact Social
{
    // отн. wife: Man -> Woman
    wife = ~husband // ~ - поменять атомы местами
}
fact SocialConvention
{
    no (wife + husband) & ^(mother + father)
}

assert NoSelfFather
{
    no m: Man | m = m.father
    no w: Woman | w = w.mother
} 

check NoSelfFather for 10

// get set of grandfathers of a person
fun grandpas (p: Person): set Person
{
    let parents = mother + father 
        // Мачеха  Отчим
        + father.wife + mother.husband |
    p.parents.parents & Man
}

pred ownGrandpa (p: Person)
{
    p in grandpas[p]
}

run ownGrandpa for 20
*/



sig Obj
{
    greater: lone Obj
}

fact
{
    one o: Obj | o.is_zero
    no o: Obj | o = o.greater
    no o: Obj | o in o.^greater
}

pred is_zero [o: Obj]
{
    Obj in o.^greater + o
}

run {}




