Content-Type: multipart/mixed; boundary="===============3065508836459016740=="
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: lkp@lists.01.org
Subject: Re: [mm, vmstat] 373ccbe592: BUG: unable to handle kernel
Date: Mon, 18 Jan 2016 02:26:52 +0000
Message-ID: <1453084012.2519.98.camel@decadent.org.uk>
In-Reply-To: <201601081932.GCE21843.HFQOtOSLFJFOVM@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============3065508836459016740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-01-08 at 19:32 +0900, Tetsuo Handa wrote:
[...]
> Thank you. I think that start_shepherd_timer() started shepherd item
> and vmstat_shepherd() is called before vmstat_wq =3D alloc_workqueue() is
> called. We are sometimes too late to allocate vmstat_wq workqueue.
> Please try below one.
> =

> ----------
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 4ebc17d..6478929 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1545,12 +1545,12 @@ static struct notifier_block vmstat_notifier =3D
> =C2=A0static int __init setup_vmstat(void)
> =C2=A0{
> =C2=A0#ifdef CONFIG_SMP
> +	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
> =C2=A0	cpu_notifier_register_begin();
> =C2=A0	__register_cpu_notifier(&vmstat_notifier);
> =C2=A0
> =C2=A0	start_shepherd_timer();
> =C2=A0	cpu_notifier_register_done();
> -	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
> =C2=A0#endif
> =C2=A0#ifdef CONFIG_PROC_FS
> =C2=A0	proc_create("buddyinfo", S_IRUGO, NULL, &fragmentation_file_operat=
ions);
> ----------
> =

> We need to backport this fix to stable since this commit already went to =
3.2.75.

Thanks. =C2=A0In 3.2.75 this precise race doesn't seem to exist, but I did
put the alloc_workqueue() after register_cpu_notifier() whereas it
should go before.

Ben.

-- =

Ben Hutchings
A free society is one where it is safe to be unpopular. - Adlai Stevenson

--===============3065508836459016740==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSVZBd1VB
VnB4TmJPZS95T3lWaGhFSkFRcmx2US8rT0grNm4rTlhvTFVjM2FRUHdVdndXYkV2eHhvendYWUoK
Z2wzNFJSVEpFTjRwdU9tZlJUVFg1dDBTTVZ5ZUV3TEVsTHVWSk5CV0xLd2hteEh4eVRhTytYRU9o
cSsvSkswZAo2MXNlNXFKRXUrZlhaMTVucUNIZncwYTdrbWx5OTh5WmQ4QzYzUGhPcmZCWjIxMVFw
czcvMUd4d2JoZUl6MW5VCkJVRHFmelJ3Z0Q4U0JTajVDN1pueUxrTloyTzZ6ZEUvWWc5TkxyWGZL
R1U2SzBic0dFQXM3NXI2VytDYzI5dzkKZ3N1S2pkcENseW45RGRoZ0FrRXJtbG91WEJ0SVhGTlNm
c05JbzJYRjROejVHOWM3VTEwdWZCL3cwc2xzSXl3YQpza0hvYURVY0wzd1JnZXFGZDRFbFFxQ3Zx
R2E0MytRNUw1Y1VDQjdlV2RGbjRFQ01abWI5eThyVHFjcGtsK0ZlCnJJRkdlOUVFZFZMZmJCZUdR
ei9xNU0waHd2MzBYWnRiNlNidklFT3hGY2x2OHp4cmxhQ3oyU0JXTWErR01rdmcKN0VLRFVFWnd2
UmpKS1R1QWhxTmRuQmxRcFV0MTFZUEZaNlREZm8xNXBjeUZUVCs1cTREeW1ib1N5RVoydHZldAo0
aHVKOVJlVjlLVmdVSjl0WWVoRE5SUmpYN2grbFVGZjlMZUJUMFdlWnVpNi81ZGk2OFI3OHRIZlNY
MHNxd3hrClhFN2ZFbVYrTVZ3RmMweHBOVCtjbk9FRjJWZjdaSXVDRDRrZkI2TENYY2M4S0ptUERz
Wi9SOURkZCtTQi92SmgKTHZINlJUV21SVGNyMU53aUdLR0VSQjRwS0FxOHJ5Tk5yUCtFdG9HaGc4
WU16NlZMOUFzdXJ1WVdyRHFiWmM4Vwpmb3laWlJ5THR4bz0KPUVORloKLS0tLS1FTkQgUEdQIFNJ
R05BVFVSRS0tLS0tCg==

--===============3065508836459016740==--

