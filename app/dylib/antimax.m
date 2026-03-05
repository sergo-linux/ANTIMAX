#import <UIKit/UIKit.h>

// Конструктор: выполняется автоматически при загрузке библиотеки
__attribute__((constructor))
static void initialize() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // Получаем активное окно приложения
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        UIViewController *rootVC = window.rootViewController;
        
        if (rootVC) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ошибка #3"
                                                                           message:@"Обнаружена критическая ошибка в модуле dylib. Приложение будет закрыто."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ОК"
                                                               style:UIAlertActionStyleDestructive
                                                             handler:^(UIAlertAction * _Nonnull action) {
                // Принудительный выход
                exit(0);
            }];
            
            [alert addAction:okAction];
            [rootVC presentViewController:alert animated:YES completion:nil];
        }
    });
}
