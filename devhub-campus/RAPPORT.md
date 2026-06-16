
## Étape 9 — Sécurisation ArgoCD

### RBAC
- Rôle `developer` : get + sync uniquement, pas de delete
- Rôle `platform-admin` : accès complet
- Compte `developer1` testé : peut syncer, ne peut pas supprimer ✅

### Notifications
- Webhook configuré sur webhook.site
- Trigger : app Degraded ou sync Unknown
- Testé avec image inexistante → notification reçue ✅

