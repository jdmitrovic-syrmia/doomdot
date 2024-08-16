(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" default))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages nil)
 '(which-function-mode t)
 '(which-key-custom-hide-popup-function 'which-key--hide-buffer-side-window)
 '(which-key-custom-popup-max-dimensions-function '(closure (t) (_) (which-key--side-window-max-dimensions)))
 '(which-key-custom-show-popup-function
   '(closure
     (t)
     (act-popup-dim)
     (let
         ((display-buffer-in-side-window
           (symbol-function #'display-buffer-in-side-window)))
       (ignore display-buffer-in-side-window)
       (let*
           ((vnew
             #'(lambda
                 (buffer alist)
                 (+popup-display-buffer-stacked-side-window-fn buffer
                                                               (append
                                                                '((vslot . -9999)
                                                                  (select . t))
                                                                alist))))
            (old
             (symbol-function #'display-buffer-in-side-window)))
         (unwind-protect
             (progn
               (fset #'display-buffer-in-side-window vnew)
               (progn
                 (setcar act-popup-dim
                         (1+
                          (car act-popup-dim)))
                 (which-key--show-buffer-side-window act-popup-dim)))
           (fset #'display-buffer-in-side-window old)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
