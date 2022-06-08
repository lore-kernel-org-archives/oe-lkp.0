Content-Type: multipart/mixed; boundary="===============0811964018767354279=="
MIME-Version: 1.0
From: Moshe Kol <moshe.kol@mail.huji.ac.il>
To: lkp@lists.01.org
Subject: Re: [tcp] e926147618: stress-ng.icmp-flood.ops_per_sec -8.7% regression
Date: Wed, 08 Jun 2022 10:26:12 +0300
Message-ID: <CACi_AuAr70bDB79zg9aAF1rD7e1qGgFwCGCAPYtS-zCp_zA0iw@mail.gmail.com>
In-Reply-To: <20220608064822.GC7547@1wt.eu>
List-Id: <oe-lkp.lists.linux.dev>

--===============0811964018767354279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hmm, How is the ICMP flood stress test related to TCP connections?

On Wed, Jun 8, 2022, 09:48 Willy Tarreau <w@1wt.eu> wrote:

> On Wed, Jun 08, 2022 at 02:08:02PM +0800, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed a -8.7% regression of stress-ng.icmp-flood.ops_per_sec
> due to commit:
> >
> >
> > commit: e9261476184be1abd486c9434164b2acbe0ed6c2 ("tcp: dynamically
> allocate the perturb table used by source ports")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > in testcase: stress-ng
> > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358
> CPU @ 2.60GHz with 128G memory
> > with following parameters:
> >
> >       nr_threads: 100%
> >       testtime: 60s
> >       class: network
> >       test: icmp-flood
> >       cpufreq_governor: performance
> >       ucode: 0xd000331
> >
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> >
> > Details are as below:
> >
> -------------------------------------------------------------------------=
------------------------->
> >
> >
> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         sudo bin/lkp install job.yaml           # job file is attached
> in this email
> >         bin/lkp split-job --compatible job.yaml # generate the yaml file
> for lkp run
> >         sudo bin/lkp run generated-yaml-file
> >
> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> >
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test=
/testcase/testtime/ucode:
> >
>  network/gcc-11/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-20200=
603.cgz/lkp-icl-2sp6/icmp-flood/stress-ng/60s/0xd000331
> >
> > commit:
> >   ca7af04025 ("tcp: add small random increments to the source port")
> >   e926147618 ("tcp: dynamically allocate the perturb table used by
> source ports")
> >
> > ca7af0402550f9a0 e9261476184be1abd486c943416
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >  5.847e+08            -8.7%  5.337e+08        stress-ng.icmp-flood.ops
> >    9745088            -8.7%    8894785
> stress-ng.icmp-flood.ops_per_sec
> (...)
>
> I don't know much what to think about it, to be honest. We anticipated
> a possible very tiny slowdown by moving the table from static to dynamic,
> though that was not observed at all during extensive tests on real
> hardware. But it was not acceptable to keep too large a table as static
> anyway.
>
> >     102391 =C4=85  2%      -8.1%      94064
> stress-ng.time.involuntary_context_switches
> >       3069 =C4=85  2%      -9.6%       2775 =C4=85  4%
> stress-ng.time.percent_of_cpu_this_job_got
> >       1857 =C4=85  2%      -9.3%       1685 =C4=85  4%  stress-ng.time.=
system_time
> >      47.67 =C4=85  4%     -20.9%      37.70 =C4=85  5%  stress-ng.time.=
user_time
>
> Not sure what to think about these variations, nor how they may be relate=
d.
>
> Thanks,
> Willy
>

--===============0811964018767354279==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkhtbSwgSG93IGlzIHRoZSBJQ01QIGZsb29kIHN0cmVzcyB0ZXN0IHJl
bGF0ZWQgdG8gVENQIGNvbm5lY3Rpb25zPzwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgSnVuIDgsIDIwMjIs
IDA5OjQ4IFdpbGx5IFRhcnJlYXUgJmx0OzxhIGhyZWY9Im1haWx0bzp3QDF3dC5ldSI+d0Axd3Qu
ZXU8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFk
ZGluZy1sZWZ0OjFleCI+T24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDI6MDg6MDJQTSArMDgwMCwg
a2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgR3Jl
ZXRpbmcsPGJyPgomZ3Q7IDxicj4KJmd0OyBGWUksIHdlIG5vdGljZWQgYSAtOC43JSByZWdyZXNz
aW9uIG9mIHN0cmVzcy1uZy5pY21wLWZsb29kLm9wc19wZXJfc2VjIGR1ZSB0byBjb21taXQ6PGJy
PgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgY29tbWl0OiBlOTI2MTQ3NjE4NGJlMWFiZDQ4NmM5
NDM0MTY0YjJhY2JlMGVkNmMyICgmcXVvdDt0Y3A6IGR5bmFtaWNhbGx5IGFsbG9jYXRlIHRoZSBw
ZXJ0dXJiIHRhYmxlIHVzZWQgYnkgc291cmNlIHBvcnRzJnF1b3Q7KTxicj4KJmd0OyA8YSBocmVm
PSJodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0PC9hPiBtYXN0ZXI8YnI+CiZndDsgPGJyPgomZ3Q7IGluIHRlc3RjYXNlOiBzdHJlc3Mtbmc8
YnI+CiZndDsgb24gdGVzdCBtYWNoaW5lOiAxMjggdGhyZWFkcyAyIHNvY2tldHMgSW50ZWwoUikg
WGVvbihSKSBQbGF0aW51bSA4MzU4IENQVSBAIDIuNjBHSHogd2l0aCAxMjhHIG1lbW9yeTxicj4K
Jmd0OyB3aXRoIGZvbGxvd2luZyBwYXJhbWV0ZXJzOjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDC
oCDCoG5yX3RocmVhZHM6IDEwMCU8YnI+CiZndDvCoCDCoCDCoCDCoHRlc3R0aW1lOiA2MHM8YnI+
CiZndDvCoCDCoCDCoCDCoGNsYXNzOiBuZXR3b3JrPGJyPgomZ3Q7wqAgwqAgwqAgwqB0ZXN0OiBp
Y21wLWZsb29kPGJyPgomZ3Q7wqAgwqAgwqAgwqBjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5j
ZTxicj4KJmd0O8KgIMKgIMKgIMKgdWNvZGU6IDB4ZDAwMDMzMTxicj4KJmd0OyA8YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRs
eSBhZGQgZm9sbG93aW5nIHRhZzxicj4KJmd0OyBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgJmx0OzxhIGhyZWY9Im1haWx0bzpvbGl2ZXIuc2FuZ0BpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIiByZWw9Im5vcmVmZXJyZXIiPm9saXZlci5zYW5nQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgom
Z3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgRGV0YWlscyBhcmUgYXMgYmVsb3c6PGJyPgomZ3Q7IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tJmd0Ozxicj4KJmd0OyA8YnI+
CiZndDsgPGJyPgomZ3Q7IFRvIHJlcHJvZHVjZTo8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAg
wqAgwqBnaXQgY2xvbmUgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0
cy5naXQiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQ8L2E+PGJyPgomZ3Q7wqAgwqAgwqAgwqAg
wqBjZCBsa3AtdGVzdHM8YnI+CiZndDvCoCDCoCDCoCDCoCDCoHN1ZG8gYmluL2xrcCBpbnN0YWxs
IGpvYi55YW1swqAgwqAgwqAgwqAgwqAgwqAjIGpvYiBmaWxlIGlzIGF0dGFjaGVkIGluIHRoaXMg
ZW1haWw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoGJpbi9sa3Agc3BsaXQtam9iIC0tY29tcGF0aWJs
ZSBqb2IueWFtbCAjIGdlbmVyYXRlIHRoZSB5YW1sIGZpbGUgZm9yIGxrcCBydW48YnI+CiZndDvC
oCDCoCDCoCDCoCDCoHN1ZG8gYmluL2xrcCBydW4gZ2VuZXJhdGVkLXlhbWwtZmlsZTxicj4KJmd0
OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCMgaWYgY29tZSBhY3Jvc3MgYW55IGZhaWx1cmUgdGhh
dCBibG9ja3MgdGhlIHRlc3QsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAjIHBsZWFzZSByZW1vdmUg
fi8ubGtwIGFuZCAvbGtwIGRpciB0byBydW4gZnJvbSBhIGNsZWFuIHN0YXRlLjxicj4KJmd0OyA8
YnI+CiZndDsgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+CiZndDsgY2xhc3Mv
Y29tcGlsZXIvY3B1ZnJlcV9nb3Zlcm5vci9rY29uZmlnL25yX3RocmVhZHMvcm9vdGZzL3Rib3hf
Z3JvdXAvdGVzdC90ZXN0Y2FzZS90ZXN0dGltZS91Y29kZTo8YnI+CiZndDvCoCDCoG5ldHdvcmsv
Z2NjLTExL3BlcmZvcm1hbmNlL3g4Nl82NC1yaGVsLTguMy8xMDAlL2RlYmlhbi0xMC40LXg4Nl82
NC0yMDIwMDYwMy5jZ3ovbGtwLWljbC0yc3A2L2ljbXAtZmxvb2Qvc3RyZXNzLW5nLzYwcy8weGQw
MDAzMzE8YnI+CiZndDsgPGJyPgomZ3Q7IGNvbW1pdDogPGJyPgomZ3Q7wqAgwqBjYTdhZjA0MDI1
ICgmcXVvdDt0Y3A6IGFkZCBzbWFsbCByYW5kb20gaW5jcmVtZW50cyB0byB0aGUgc291cmNlIHBv
cnQmcXVvdDspPGJyPgomZ3Q7wqAgwqBlOTI2MTQ3NjE4ICgmcXVvdDt0Y3A6IGR5bmFtaWNhbGx5
IGFsbG9jYXRlIHRoZSBwZXJ0dXJiIHRhYmxlIHVzZWQgYnkgc291cmNlIHBvcnRzJnF1b3Q7KTxi
cj4KJmd0OyA8YnI+CiZndDsgY2E3YWYwNDAyNTUwZjlhMCBlOTI2MTQ3NjE4NGJlMWFiZDQ4NmM5
NDM0MTYgPGJyPgomZ3Q7IC0tLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tIDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgICVzdGRkZXbCoCDCoCDCoCVjaGFuZ2XCoCDCoCDC
oCDCoCDCoCVzdGRkZXY8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBcwqAgwqAgwqAgwqAg
wqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFzCoCA8YnI+CiZndDvCoCA1Ljg0N2UrMDjCoCDC
oCDCoCDCoCDCoCDCoCAtOC43JcKgIDUuMzM3ZSswOMKgIMKgIMKgIMKgIHN0cmVzcy1uZy5pY21w
LWZsb29kLm9wczxicj4KJmd0O8KgIMKgIDk3NDUwODjCoCDCoCDCoCDCoCDCoCDCoCAtOC43JcKg
IMKgIDg4OTQ3ODXCoCDCoCDCoCDCoCBzdHJlc3MtbmcuaWNtcC1mbG9vZC5vcHNfcGVyX3NlYzxi
cj4KKC4uLik8YnI+Cjxicj4KSSBkb24mIzM5O3Qga25vdyBtdWNoIHdoYXQgdG8gdGhpbmsgYWJv
dXQgaXQsIHRvIGJlIGhvbmVzdC4gV2UgYW50aWNpcGF0ZWQ8YnI+CmEgcG9zc2libGUgdmVyeSB0
aW55IHNsb3dkb3duIGJ5IG1vdmluZyB0aGUgdGFibGUgZnJvbSBzdGF0aWMgdG8gZHluYW1pYyw8
YnI+CnRob3VnaCB0aGF0IHdhcyBub3Qgb2JzZXJ2ZWQgYXQgYWxsIGR1cmluZyBleHRlbnNpdmUg
dGVzdHMgb24gcmVhbDxicj4KaGFyZHdhcmUuIEJ1dCBpdCB3YXMgbm90IGFjY2VwdGFibGUgdG8g
a2VlcCB0b28gbGFyZ2UgYSB0YWJsZSBhcyBzdGF0aWM8YnI+CmFueXdheS48YnI+Cjxicj4KJmd0
O8KgIMKgIMKgMTAyMzkxIMSFwqAgMiXCoCDCoCDCoCAtOC4xJcKgIMKgIMKgIDk0MDY0wqAgwqAg
wqAgwqAgc3RyZXNzLW5nLnRpbWUuaW52b2x1bnRhcnlfY29udGV4dF9zd2l0Y2hlczxicj4KJmd0
O8KgIMKgIMKgIMKgMzA2OSDEhcKgIDIlwqAgwqAgwqAgLTkuNiXCoCDCoCDCoCDCoDI3NzUgxIXC
oCA0JcKgIHN0cmVzcy1uZy50aW1lLnBlcmNlbnRfb2ZfY3B1X3RoaXNfam9iX2dvdDxicj4KJmd0
O8KgIMKgIMKgIMKgMTg1NyDEhcKgIDIlwqAgwqAgwqAgLTkuMyXCoCDCoCDCoCDCoDE2ODUgxIXC
oCA0JcKgIHN0cmVzcy1uZy50aW1lLnN5c3RlbV90aW1lPGJyPgomZ3Q7wqAgwqAgwqAgNDcuNjcg
xIXCoCA0JcKgIMKgIMKgLTIwLjklwqAgwqAgwqAgMzcuNzAgxIXCoCA1JcKgIHN0cmVzcy1uZy50
aW1lLnVzZXJfdGltZTxicj4KPGJyPgpOb3Qgc3VyZSB3aGF0IHRvIHRoaW5rIGFib3V0IHRoZXNl
IHZhcmlhdGlvbnMsIG5vciBob3cgdGhleSBtYXkgYmUgcmVsYXRlZC48YnI+Cjxicj4KVGhhbmtz
LDxicj4KV2lsbHk8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============0811964018767354279==--

