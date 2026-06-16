# 

the pod depends on the durum-CR to have the status finised to start

```bash
 kubectl patch durum hunger --subresource=status --type=merge -p='{"status": { "order": "feddisch"}}'
```
