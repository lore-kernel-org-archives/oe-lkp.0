Content-Type: multipart/mixed; boundary="===============5437280240569855970=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 19:37:05 +0200
Message-ID: <20140731173705.GC19379@twins.programming.kicks-ass.net>
In-Reply-To: <53DA7129.7020100@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5437280240569855970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 06:39:05PM +0200, Jirka Hladky wrote:
> I'm doing 3 iterations (3 runs) to get some statistics. To speed up the t=
est
> significantly please do the run with 20 warehouses only
> (or in general with #warehouses =3D=3D  number of nodes * number of PHYSI=
CAL
> cores)

Yeah, went and did that for my 4 node machine, its got a ton more cores, bu=
t I
matches the warehouses to it:

-a43455a1d57	tip/master

979996.47	1144715.44
876146		1098499.07
1058974.18	1019499.38
1055951.59	1139405.22
970504.01	1099659.09

988314.45	1100355.64	(avg)
75059.546179565	50085.7473975167(stdev)

So for 5 runs, tip/master (which includes the offending patch) wins hands d=
own.

Each run is 2 minutes.

--===============5437280240569855970==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDJuN0JBQW9KRUhaSDRhUkx3T1M2K280UC8zcm1ZVGlX
SEh1WHo5cm91WE42djhMeAozb2k1QmN0TkhQcjdvSWl3Skh4aWFMNUN0M0V6NFhTNVhLUDJaRnhv
NStXRTFzNEI5L1BPVUlJenJJVGw0SGVDCjIvcnVUejFqYTQxNVAyQXJuK3ptRHZGaGIwRlM4bVRn
bEJ5Qk9jNjhEbnRadm5DWnBJQ21wbjZVSXdIRmtyRHYKVlg4ZVc1dEJkMDVacTJnc2JjZERtTXJB
RExKUENLczdjcEtSWE5kWFZObnQ1RkEwT3RPdnRTZHFjdGpMc1ZIQgovdDZQcTJtZnFYdGxpdlFl
cEhuUFh6VlRVSTFzcjFFenljZVBuTTQzTmdLQitGdUpndVZDV21YcFFMUDdRcmdICjJFY2c2WVl1
UHRDUEthclJSUzEwZm9YbXkxajFLbyt1ckZROVJkcmhVWFZISjBacnAwRmIxdmFCM3BlZEVkRHQK
dTgwa05mOUFzS1BJS1c0TFlxM0ZacS9ubWFiSzB5cnV0YzQ2a3NMemxIZzNoU0M3bjRvNmUzZlhn
TDY4SDhMcQpnaS9ncDR0TFhpQTZjei9CYUU1R2xKOWJFS3F1alh3aFptR1I5WXpQTjlDYmVLL3p4
VkhlbUdIdTF4b2ZWUWloCkt6VnN6TjcxVEgxQi9nbUpBaW8yZmlBcDJnNm5JTFh6SG5mY2RLdGdO
Z0hyaDZ4N0JnMng3SlpjYlNFZURjSXUKWWpFQzlkbjZaK1oxVkQ4RktFOGczYkJEb1VOd3JJak9u
NXJGd2dxVjBzdEdQVXkyc2tQRGExdHdrNmFmNlR1dQpmVEdRcWVmK09nODZzSjhkY0UzQnN0bnJx
QmVkMTFyL3oydEhtN3h0dENSS3FoYnAwQ01QbUIwM29Ed0x4TWZ1Cit4cGtXeEhGMEVPMzFrMzVN
QjN6Cj1pSW9QCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5437280240569855970==--

