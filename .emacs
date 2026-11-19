;;; -*- lexical-binding: t -*-

;; --- Package setup (must come first) ---
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages
      '(consult corfu ef-themes exec-path-from-shell magit
                marginalia orderless vertico))

;; Install anything missing; only touches the network when needed.
(unless (seq-every-p #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (package-install-selected-packages t))

;; --- Custom-managed settings ---
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(ef-night))
 '(custom-safe-themes
   '("5e2b82d4d3c794cdc1d46fe2a6ca54efed4df7caaefa3e80d6f566a9a24bc881"
     default))
 '(fringe-mode 0 nil (fringe))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(consult corfu ef-themes exec-path-from-shell magit marginalia
             orderless org-modern vertico))
 '(scroll-bar-mode nil)
 '(tab-bar-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight regular :height 120 :width normal)))))

;; --- General settings ---
(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq eshell-scroll-show-maximum-output nil)

(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(setq make-pointer-invisible t)

(setq ns-right-alternate-modifier 'nil)
(setq ns-alternate-modifier 'meta)

;; --- Completion ---
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

(exec-path-from-shell-initialize)

(vertico-mode 1)
(marginalia-mode 1)
(global-corfu-mode 1)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(global-org-modern-mode)
