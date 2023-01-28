class AppText {
  const AppText._();

  static const String name = 'Дмитро Казаков';
  static const String boxing = 'Boxing';
  static const String fitBoxing = 'Fitboxing';
  static const String time = '15.02 | 14:00 (55 хв)';
  static const String address = 'Zhylianska St, 41A, Kyiv, 01033';
  static const String info =
      'Відчуй і збільш свою силу на боксінгу. Розкріпачуйся в темному залі під потужний біт хіп-хопу. Став удар на Грушах';
  static const String importantInfo = 'Важлива інформація';
  static const String review =
      'На тренування необхідно взяти будь-яку спортивну форму, що не сковує рухів, кросівки та гелеві бинти, придбати можна в студії за 500 грн.\n\nМи дбаємо про Вашу безпеку, тому не допускаємо до занять у разі запізнення більш, ніж на 5 хвилин з початку';

  static const String remain = 'Залишилося 2 місця';

  static const String booking = 'Booking';
  static const String back = 'Back';
  static const String addCalendar = 'Add Calendar';
  static const String saved = 'Saved';
}

enum Status {
  initial,
  loading,
  loaded,
  error,
}
