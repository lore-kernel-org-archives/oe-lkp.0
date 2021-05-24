Content-Type: multipart/mixed; boundary="===============8475984162305365847=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 69bc1b14c3: netperf.Throughput_Mbps -36.9% regression
Date: Mon, 24 May 2021 10:46:54 +0800
Message-ID: <49d2cb2c-8a6f-f8a5-af07-b9be2d59f73e@intel.com>
In-Reply-To: <YKhGKjn9kP7ZlwJS@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8475984162305365847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

On 5/22/2021 7:45 AM, Andrea Arcangeli wrote:
> Hi Xing,
>
> On Fri, May 21, 2021 at 03:20:05PM +0800, Xing, Zhengjun wrote:
>> I tried the patch, it cannot recover the regression.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> tbox_group/testcase/rootfs/kconfig/compiler/ip/runtime/nr_threads/cluste=
r/send_size/test/cpufreq_governor/ucode:
>> lkp-csl-2ap3/netperf/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc=
-9/ipv4/300s/1/cs-localhost/5K/TCP_SENDFILE/performance/0x5003006
>>
>> commit:
>>   =C2=A0 95507e764cfbae8cbf72fcc747030d5d7b5b6336
>>   =C2=A0 69bc1b14c3d0ebfc25ebcb7647a21d659602a93a
>>   =C2=A0 c913de594c7cca699bada4dfabd9aa3e1a48d94b (the test patch)
>>
>> 95507e764cfbae8c 69bc1b14c3d0ebfc25ebcb7647a c913de594c7cca699bada4dfabd
>> ---------------- --------------------------- ---------------------------
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=
=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stdde=
v=C2=A0=C2=A0=C2=A0=C2=A0 %change %stddev
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
>>   =C2=A0=C2=A0=C2=A0=C2=A0 25179=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -36.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15893 =C2=B1=C2=
=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -35.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16336 =
=C2=B1
>> 16%=C2=A0 netperf.Throughput_Mbps
>>   =C2=A0=C2=A0=C2=A0=C2=A0 25179=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -36.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15893 =C2=B1=C2=
=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -35.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16336 =
=C2=B1
>> 16%=C2=A0 netperf.Throughput_total_Mbps
>>   =C2=A01.844e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -36.9%=C2=A0 1.164e+08 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -35.1=
%=C2=A0 1.197e+08 =C2=B1
>> 16%=C2=A0 netperf.workload
>>
> Thanks for the quick test, appreciated.
>
> So when I checked again I noticed I already got the system a few days
> ago, that resembled the 96 CPUs with this topology:
>
> CPU(s):              112
> On-line CPU(s) list: 0-111
> Thread(s) per core:  2
> Core(s) per socket:  28
> Socket(s):           2
> NUMA node(s):        2
> L1d cache:           48K
> L1i cache:           32K
> L2 cache:            1280K
> L3 cache:            43008K
> NUMA node0 CPU(s):   0-27,56-83
> NUMA node1 CPU(s):   28-55,84-111
>
> cpu family      : 6
> model           : 106
> stepping        : 6
> microcode       : 0xd000170
>
> sched/fair fix reverted:
>
> Size   Size    Size     Time     Throughput  local    remote   local   re=
mote
> bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us=
/KB
> 131072  16384   5120    10.00      28529.58   1.56     1.56     0.500   0=
.500
> 131072  16384   5120    10.00      28524.45   1.55     1.55     0.499   0=
.499
>
> sched/fair fix applied:
>
> Size   Size    Size     Time     Throughput  local    remote   local   re=
mote
> bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us=
/KB
> 131072  16384   5120    300.00     29400.87   1.55     1.55     0.485   0=
.485
> 131072  16384   5120    10.00      29497.69   1.56     1.56     0.484   0=
.484
>
> So basically this -36.9% regression isn't so easy to reproduce for
> me, I still reproduce a gain... oh well.
>
> I run a self built netperf with these options following your script
> files attached:
>
> ./netperf/src/netserver -4 -D
> netperf/src/netperf -4 -H 127.0.0.1 -t TCP_SENDFILE -c -C -l 10 -- -m 5K
The command we used :
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netperf -4 -H 127.0.0.1 -t TCP_=
SENDFILE -c -C -l 300 -- -m 5K=C2=A0 &

 =C2=A0It runs 300 s, but your test case only runs 10 s, I think you can tr=
y =

to test more long time.
>
> I only managed to do a very quick test so far, but I'll do more tests
> also with the other workloads that you reported as regressed, like
> stress-ng and I'm not using your .config yet. My .config is attached,
> it's based on centos8 config if you want to try it, it should work and
> be able to boot on any hardware.
>
> I don't think it's a .config issue though, more likely I got lucky
> hardware again, but at least I got plenty of cores per socket (and 2
> sockets) now so it should be closer.
>
> Anyway given your results the sched/fair patch is probably better to
> consider it incomplete and just research for now... I'm not dropping
> it though, since I'd like to be able to reproduce a regression locally
> so I can debug it perhaps and fix it. For now it appears to help in
> other cases, like also appeared to happen above.
>
> Next thing I'll do is to run it in a loop killing the server every
> time too and see if there's some outlier or if it runs steady, if run
> long enough with a bit of background load, it should move to different
> CPUs randomly. I'll try to monitor where it runs while it runs too to
> be sure it moves.
>
> Thanks,
> Andrea
>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing


--===============8475984162305365847==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsKICAgICAgY2hhcnNldD13aW5kb3dzLTEyNTIiPgogIDwvaGVhZD4KICA8
Ym9keT4KICAgIEhpIEFuZHJlYSw8YnI+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0
ZS1wcmVmaXgiPk9uIDUvMjIvMjAyMSA3OjQ1IEFNLCBBbmRyZWEgQXJjYW5nZWxpCiAgICAgIHdy
b3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlk
OllLaEdLam45a1A3Wmx3SlNAcmVkaGF0LmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+SGkgWGluZywKCk9uIEZyaSwgTWF5IDIxLCAyMDIxIGF0IDAzOjIwOjA1
UE0gKzA4MDAsIFhpbmcsIFpoZW5nanVuIHdyb3RlOgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5J
IHRyaWVkIHRoZSBwYXRjaCwgaXQgY2Fubm90IHJlY292ZXIgdGhlIHJlZ3Jlc3Npb24uCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CnRib3hfZ3JvdXAvdGVzdGNhc2Uvcm9vdGZzL2tj
b25maWcvY29tcGlsZXIvaXAvcnVudGltZS9ucl90aHJlYWRzL2NsdXN0ZXIvc2VuZF9zaXplL3Rl
c3QvY3B1ZnJlcV9nb3Zlcm5vci91Y29kZToKbGtwLWNzbC0yYXAzL25ldHBlcmYvZGViaWFuLTEw
LjQteDg2XzY0LTIwMjAwNjAzLmNnei94ODZfNjQtcmhlbC04LjMvZ2NjLTkvaXB2NC8zMDBzLzEv
Y3MtbG9jYWxob3N0LzVLL1RDUF9TRU5ERklMRS9wZXJmb3JtYW5jZS8weDUwMDMwMDYKCmNvbW1p
dDoKIKAgOTU1MDdlNzY0Y2ZiYWU4Y2JmNzJmY2M3NDcwMzBkNWQ3YjViNjMzNgogoCA2OWJjMWIx
NGMzZDBlYmZjMjVlYmNiNzY0N2EyMWQ2NTk2MDJhOTNhCiCgIGM5MTNkZTU5NGM3Y2NhNjk5YmFk
YTRkZmFiZDlhYTNlMWE0OGQ5NGIgKHRoZSB0ZXN0IHBhdGNoKQoKOTU1MDdlNzY0Y2ZiYWU4YyA2
OWJjMWIxNGMzZDBlYmZjMjVlYmNiNzY0N2EgYzkxM2RlNTk0YzdjY2E2OTliYWRhNGRmYWJkCi0t
LS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogoKCgoKCgoKAgJXN0ZGRldqCgoKAgJWNoYW5nZaCgoKCgoKCgICVzdGRk
ZXagoKCgICVjaGFuZ2UgJXN0ZGRldgogoKCgoKCgoKCgoKCgIFygoKCgoKCgoKAgfKCgoKCgoKCg
oKCgoKCgoCBcoKCgoKCgoKCgIHwgXAogoKCgoCAyNTE3OaCgoKCgoKCgoKAgLTM2LjkloKCgoKAg
MTU4OTMgsaAgNyWgoKCgIC0zNS4xJaCgoKCgIDE2MzM2ILEgCjE2JaAgbmV0cGVyZi5UaHJvdWdo
cHV0X01icHMKIKCgoKAgMjUxNzmgoKCgoKCgoKCgIC0zNi45JaCgoKCgIDE1ODkzILGgIDcloKCg
oCAtMzUuMSWgoKCgoCAxNjMzNiCxIAoxNiWgIG5ldHBlcmYuVGhyb3VnaHB1dF90b3RhbF9NYnBz
CiCgMS44NDRlKzA4oKCgoKCgoKCgoCAtMzYuOSWgIDEuMTY0ZSswOCCxoCA3JaCgoKAgLTM1LjEl
oCAxLjE5N2UrMDggsSAKMTYloCBuZXRwZXJmLndvcmtsb2FkCgo8L3ByZT4KICAgICAgPC9ibG9j
a3F1b3RlPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpUaGFua3Mg
Zm9yIHRoZSBxdWljayB0ZXN0LCBhcHByZWNpYXRlZC4KClNvIHdoZW4gSSBjaGVja2VkIGFnYWlu
IEkgbm90aWNlZCBJIGFscmVhZHkgZ290IHRoZSBzeXN0ZW0gYSBmZXcgZGF5cwphZ28sIHRoYXQg
cmVzZW1ibGVkIHRoZSA5NiBDUFVzIHdpdGggdGhpcyB0b3BvbG9neToKCkNQVShzKTogICAgICAg
ICAgICAgIDExMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKT24tbGluZSBDUFUo
cykgbGlzdDogMC0xMTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApUaHJlYWQocykg
cGVyIGNvcmU6ICAyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCkNvcmUocykg
cGVyIHNvY2tldDogIDI4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKU29ja2V0
KHMpOiAgICAgICAgICAgMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApOVU1B
IG5vZGUocyk6ICAgICAgICAyCkwxZCBjYWNoZTogICAgICAgICAgIDQ4SwpMMWkgY2FjaGU6ICAg
ICAgICAgICAzMksKTDIgY2FjaGU6ICAgICAgICAgICAgMTI4MEsKTDMgY2FjaGU6ICAgICAgICAg
ICAgNDMwMDhLCk5VTUEgbm9kZTAgQ1BVKHMpOiAgIDAtMjcsNTYtODMKTlVNQSBub2RlMSBDUFUo
cyk6ICAgMjgtNTUsODQtMTExCgpjcHUgZmFtaWx5ICAgICAgOiA2Cm1vZGVsICAgICAgICAgICA6
IDEwNgpzdGVwcGluZyAgICAgICAgOiA2Cm1pY3JvY29kZSAgICAgICA6IDB4ZDAwMDE3MAoKc2No
ZWQvZmFpciBmaXggcmV2ZXJ0ZWQ6CgpTaXplICAgU2l6ZSAgICBTaXplICAgICBUaW1lICAgICBU
aHJvdWdocHV0ICBsb2NhbCAgICByZW1vdGUgICBsb2NhbCAgIHJlbW90ZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKYnl0ZXMgIGJ5dGVzICAgYnl0ZXMgICAgc2Vjcy4gICAg
MTBeNmJpdHMvcyAgJSBTICAgICAgJSBTICAgICAgdXMvS0IgICB1cy9LQgoxMzEwNzIgIDE2Mzg0
ICAgNTEyMCAgICAxMC4wMCAgICAgIDI4NTI5LjU4ICAgMS41NiAgICAgMS41NiAgICAgMC41MDAg
ICAwLjUwMCAgCjEzMTA3MiAgMTYzODQgICA1MTIwICAgIDEwLjAwICAgICAgMjg1MjQuNDUgICAx
LjU1ICAgICAxLjU1ICAgICAwLjQ5OSAgIDAuNDk5ICAKCnNjaGVkL2ZhaXIgZml4IGFwcGxpZWQ6
CgpTaXplICAgU2l6ZSAgICBTaXplICAgICBUaW1lICAgICBUaHJvdWdocHV0ICBsb2NhbCAgICBy
ZW1vdGUgICBsb2NhbCAgIHJlbW90ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKYnl0ZXMgIGJ5dGVzICAgYnl0ZXMgICAgc2Vjcy4gICAgMTBeNmJpdHMvcyAgJSBTICAgICAg
JSBTICAgICAgdXMvS0IgICB1cy9LQgoxMzEwNzIgIDE2Mzg0ICAgNTEyMCAgICAzMDAuMDAgICAg
IDI5NDAwLjg3ICAgMS41NSAgICAgMS41NSAgICAgMC40ODUgICAwLjQ4NSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKMTMxMDcyICAxNjM4NCAgIDUxMjAgICAgMTAuMDAgICAg
ICAyOTQ5Ny42OSAgIDEuNTYgICAgIDEuNTYgICAgIDAuNDg0ICAgMC40ODQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCgpTbyBiYXNpY2FsbHkgdGhpcyAtMzYuOSUgcmVncmVz
c2lvbiBpc24ndCBzbyBlYXN5IHRvIHJlcHJvZHVjZSBmb3IKbWUsIEkgc3RpbGwgcmVwcm9kdWNl
IGEgZ2Fpbi4uLiBvaCB3ZWxsLgoKSSBydW4gYSBzZWxmIGJ1aWx0IG5ldHBlcmYgd2l0aCB0aGVz
ZSBvcHRpb25zIGZvbGxvd2luZyB5b3VyIHNjcmlwdApmaWxlcyBhdHRhY2hlZDoKCi4vbmV0cGVy
Zi9zcmMvbmV0c2VydmVyIC00IC1ECm5ldHBlcmYvc3JjL25ldHBlcmYgLTQgLUggMTI3LjAuMC4x
IC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAxMCAtLSAtbSA1SzwvcHJlPgogICAgPC9ibG9ja3F1
b3RlPgogICAgVGhlIGNvbW1hbmQgd2UgdXNlZCA6PGJyPgogICAgoKCgoKCgoCBuZXRwZXJmIC00
IC1IIDEyNy4wLjAuMSAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwIC0tIC1tCiAgICA1S6Ag
JmFtcDs8YnI+CiAgICA8YnI+CiAgICCgSXQgcnVucyAzMDAgcywgYnV0IHlvdXIgdGVzdCBjYXNl
IG9ubHkgcnVucyAxMCBzLCBJIHRoaW5rIHlvdSBjYW4KICAgIHRyeSB0byB0ZXN0IG1vcmUgbG9u
ZyB0aW1lLiA8YnI+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6WUtoR0tq
bjlrUDdabHdKU0ByZWRoYXQuY29tIj4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIg
d3JhcD0iIj4KCkkgb25seSBtYW5hZ2VkIHRvIGRvIGEgdmVyeSBxdWljayB0ZXN0IHNvIGZhciwg
YnV0IEknbGwgZG8gbW9yZSB0ZXN0cwphbHNvIHdpdGggdGhlIG90aGVyIHdvcmtsb2FkcyB0aGF0
IHlvdSByZXBvcnRlZCBhcyByZWdyZXNzZWQsIGxpa2UKc3RyZXNzLW5nIGFuZCBJJ20gbm90IHVz
aW5nIHlvdXIgLmNvbmZpZyB5ZXQuIE15IC5jb25maWcgaXMgYXR0YWNoZWQsCml0J3MgYmFzZWQg
b24gY2VudG9zOCBjb25maWcgaWYgeW91IHdhbnQgdG8gdHJ5IGl0LCBpdCBzaG91bGQgd29yayBh
bmQKYmUgYWJsZSB0byBib290IG9uIGFueSBoYXJkd2FyZS4KCkkgZG9uJ3QgdGhpbmsgaXQncyBh
IC5jb25maWcgaXNzdWUgdGhvdWdoLCBtb3JlIGxpa2VseSBJIGdvdCBsdWNreQpoYXJkd2FyZSBh
Z2FpbiwgYnV0IGF0IGxlYXN0IEkgZ290IHBsZW50eSBvZiBjb3JlcyBwZXIgc29ja2V0IChhbmQg
Mgpzb2NrZXRzKSBub3cgc28gaXQgc2hvdWxkIGJlIGNsb3Nlci4KCkFueXdheSBnaXZlbiB5b3Vy
IHJlc3VsdHMgdGhlIHNjaGVkL2ZhaXIgcGF0Y2ggaXMgcHJvYmFibHkgYmV0dGVyIHRvCmNvbnNp
ZGVyIGl0IGluY29tcGxldGUgYW5kIGp1c3QgcmVzZWFyY2ggZm9yIG5vdy4uLiBJJ20gbm90IGRy
b3BwaW5nCml0IHRob3VnaCwgc2luY2UgSSdkIGxpa2UgdG8gYmUgYWJsZSB0byByZXByb2R1Y2Ug
YSByZWdyZXNzaW9uIGxvY2FsbHkKc28gSSBjYW4gZGVidWcgaXQgcGVyaGFwcyBhbmQgZml4IGl0
LiBGb3Igbm93IGl0IGFwcGVhcnMgdG8gaGVscCBpbgpvdGhlciBjYXNlcywgbGlrZSBhbHNvIGFw
cGVhcmVkIHRvIGhhcHBlbiBhYm92ZS4KCk5leHQgdGhpbmcgSSdsbCBkbyBpcyB0byBydW4gaXQg
aW4gYSBsb29wIGtpbGxpbmcgdGhlIHNlcnZlciBldmVyeQp0aW1lIHRvbyBhbmQgc2VlIGlmIHRo
ZXJlJ3Mgc29tZSBvdXRsaWVyIG9yIGlmIGl0IHJ1bnMgc3RlYWR5LCBpZiBydW4KbG9uZyBlbm91
Z2ggd2l0aCBhIGJpdCBvZiBiYWNrZ3JvdW5kIGxvYWQsIGl0IHNob3VsZCBtb3ZlIHRvIGRpZmZl
cmVudApDUFVzIHJhbmRvbWx5LiBJJ2xsIHRyeSB0byBtb25pdG9yIHdoZXJlIGl0IHJ1bnMgd2hp
bGUgaXQgcnVucyB0b28gdG8KYmUgc3VyZSBpdCBtb3Zlcy4KClRoYW5rcywKQW5kcmVhCjwvcHJl
PgogICAgICA8YnI+CiAgICAgIDxmaWVsZHNldCBjbGFzcz0ibWltZUF0dGFjaG1lbnRIZWFkZXIi
PjwvZmllbGRzZXQ+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+X19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTEtQIG1haWxpbmcg
bGlzdCAtLSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86
bGtwQGxpc3RzLjAxLm9yZyI+bGtwQGxpc3RzLjAxLm9yZzwvYT4KVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJt
YWlsdG86bGtwLWxlYXZlQGxpc3RzLjAxLm9yZyI+bGtwLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4K
PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgICA8cHJlIGNsYXNzPSJtb3otc2ln
bmF0dXJlIiBjb2xzPSI3MiI+LS0gClpoZW5nanVuIFhpbmc8L3ByZT4KICA8L2JvZHk+CjwvaHRt
bD4K

--===============8475984162305365847==--

