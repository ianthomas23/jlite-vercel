To deploy locally:

```bash
micromamba create -f build-environment.yml
micromamba activate jlite-build
npm install --no-save @jupyterlite/cockle
jupyter lite build --contents contents --output-dir dist
npx static-handler --cors --coop --coep --corp dist/
```
