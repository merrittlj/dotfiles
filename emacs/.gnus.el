(setq user-mail-address	"merrittlj@protonmail.com"
	  user-full-name	"Lucas Merritt")

(setq gnus-select-method
      '(nnimap "ProtonMail"
               (nnimap-address "localhost")
               (nnimap-server-port 1143)
               (nnimap-authinfo-file "~/.authinfo")
               (nnimap-stream network)))

(setq mail-user-agent 'message-user-agent)

(setq gnus-auto-select-first nil)

(setq gnus-summary-display-arrow nil)

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "localhost"
      smtpmail-smtp-service 1025)

(setq gnus-message-archive-method '(nnimap "ProtonMail")
      gnus-message-archive-group "Sent")

(setq gnus-parameters
  '(("nnimap.*"
     (gnus-use-scoring nil)
     (expiry-wait . 2)
     (display . all))))
