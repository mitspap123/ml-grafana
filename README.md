![Image1](https://github.com/mitspap123/ml-grafana/main/docs/grafana-logo.png)
## The open-source platform for monitoring and observability

The **ml-grafana** project allows you to deploy a Grafana Instance with Prometheus as `default` datasource in order to create custom Dashboards for Monitoring & Alerting

Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored. Create, explore, and share dashboards with your team and foster a data-driven culture:<br>

Visualizations: Fast and flexible client side graphs with a multitude of options. Panel plugins offer many different ways to visualize metrics and logs.<br>
Dynamic Dashboards: Create dynamic & reusable dashboards with template variables that appear as dropdowns at the top of the dashboard.<br>
Explore Metrics: Explore your data through ad-hoc queries and dynamic drilldown. Split view and compare different time ranges, queries and data sources side by side.<br>
Explore Logs: Experience the magic of switching from metrics to logs with preserved label filters. Quickly search through all your logs or streaming them live.<br>
Alerting: Visually define alert rules for your most important metrics. Grafana will continuously evaluate and send notifications to systems like Slack, PagerDuty, VictorOps, OpsGenie.<br>
Mixed Data Sources: Mix different data sources in the same graph! You can specify a data source on a per-query basis. This works for even custom datasources.<br>

## Install

### Deploy Grafana OSS on Kubernetes

If you want to install and run it on kubernetes,

1 - Create a file called `grafana.yaml` for the grafana deployment.<br>
2 - Create a file called `grafana-svc.yaml` for the grafana service.<br>
3 - Create a file called `grafana-pvc.yaml` for the grafana pvc.<br>
4 - Explore the following contents under the `.k8s` folder.<br>
5 - Apply the manifests to the Kubernetes API server and deploy the Grafana on k8s cluster<br>
6 - Check that grafana is working by running the following: `kubectl port-forward service/grafana 3000:3000`<br>
7 - Navigate to `localhost:3000` in your browser. You should see a Grafana login page.<br>
8 - Use admin for both the username and password to login.<br>

**Configuration**

- Dashboards <br />
You can configure Grafana Dashboards while provisioning the grafana instance. Check the `.k8s/grafana-dashboard-config.yaml` for documentation

- Datasource <br />
You can configure Grafana Datasource while provisioning the grafana instance. Check the `.k8s/grafana-datasource-config.yaml` for documentation, the default datasource is Prometheus.

- Deployment <br />
Release Version v9.1.0

- Service <br />
Grafana Service by default is exposed into `port=3000`

- Volume <br />
Persistent volume is optional but prefered to be mounted for storing the Grafana data.

## Git Project commands

```
cd existing_repo
git remote add origin https://github.com/mitspap123/ml-grafana.git
git branch -M main
git push -uf origin main
```

## Test and Deploy

Password and Roll-based Access is documented under a Confluence Page [here](https://mainlevel.atlassian.net/wiki/spaces/IT/pages/1555300473/Links+Passwords)
<br>
<br>
After deploying Grafana you should be able to see the following logs

```
level=info msg="Starting Grafana" version=9.1.0 commit=82e32447b4 branch=HEAD compiled=2022-08-16T09:30:13Z
logger=settings level=info msg="Config loaded from" file=/usr/share/grafana/conf/defaults.ini
logger=settings level=info msg="Config loaded from" file=/etc/grafana/grafana.ini
logger=settings level=info msg="Config overridden from command line" arg="default.paths.data=/var/lib/grafana"
logger=settings level=info msg="Config overridden from command line" arg="default.paths.logs=/var/log/grafana"
logger=settings level=info msg="Config overridden from command line" arg="default.paths.plugins=/var/lib/grafana/plugins"
logger=settings level=info msg="Config overridden from command line" arg="default.paths.provisioning=/etc/grafana/provisioning"
logger=settings level=info msg="Config overridden from command line" arg="default.log.mode=console"
logger=settings level=info msg="Config overridden from Environment variable" var="GF_PATHS_DATA=/var/lib/grafana"
logger=settings level=info msg="Config overridden from Environment variable" var="GF_PATHS_LOGS=/var/log/grafana"
logger=settings level=info msg="Config overridden from Environment variable" var="GF_PATHS_PLUGINS=/var/lib/grafana/plugins"
logger=settings level=info msg="Config overridden from Environment variable" var="GF_PATHS_PROVISIONING=/etc/grafana/provisioning"
logger=settings level=info msg="Path Home" path=/usr/share/grafana
logger=settings level=info msg="Path Data" path=/var/lib/grafana
logger=settings level=info msg="Path Logs" path=/var/log/grafana
logger=settings level=info msg="Path Plugins" path=/var/lib/grafana/plugins
logger=settings level=info msg="Path Provisioning" path=/etc/grafana/provisioning
logger=settings level=info msg="App mode production"
logger=sqlstore level=info msg="Connecting to DB" dbtype=sqlite3
logger=sqlstore level=warn msg="SQLite database file has broader permissions than it should" path=/var/lib/grafana/grafana.db mode=-rw-rw---- expected=-rw-r-----
logger=migrator level=info msg="Starting DB migrations"
logger=migrator level=info msg="migrations completed" performed=0 skipped=442 duration=797.264µs
```