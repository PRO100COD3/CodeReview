# CodeReview

# Назначение и цели приложения
Одностраничное приложение написанное на SwiftUI для загрузки сайта jobs.yourcodereview.com.

Цели приложения:

- Загрузка из сети веб сайта.
- Изучение фреймворка SwiftUI.

# Краткое описание приложения

- При запуске приложение показывает индикатор загрузки.
- После загрузки страницы, индикатор пропадает.
  
# Нефункциональные требования

## Технические требования

1. При входе в приложение показывается ProgressView.
2. После загрузки сайта показывается WebView c этим сайтом.

# Функциональные требования

# Закрузка данных из сети

При первом входе в приложение или при отсутствии задач в памяти данные загружаются из сети : "https://dummyjson.com/todos"

**Главный Экран:**

1. WebView на весь экран.

**Алгоритмы и доступные действия:**

1. Все действия произведенные на сайте возможны для выполнения в приложении.
