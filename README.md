# Задание

Сделать два прямоугольника разного цвета с закругленными краями. Анимированно добавлять и убирать каждый прямоугольник в разные стороны(один влево, другой впрово). Добавить две кнопки для управления появлением прямоугольников.

# Решение

Инициализировать две **State** переменные для отображения блоков.

	@State var showLeft = false
	@State var showRight = false


Создать расширения для **AnyTransition** с задаными направлениями движения прямоугольников

```swift

extension AnyTransition {
    static var leadingTransition: AnyTransition {
        .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading))
    }
    static var trailingTransition: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing))
    }
}

```
Добавить условие при котором отображаются блоки. К каждому блоку добавить свой модификатор направления

```swift
VStack(spacing: 26) {
                if showLeft {
                    someView(
                        label: "Left Transition",
                        color: .blue.opacity(0.25)
                    )
                    .transition(.leadingTransition)
                }
                if showRight {
                    someView(
                        label: "Right Transition",
                        color: .green.opacity(0.25)
                    )
                    .transition(.trailingTransition)
                }
            }
```