Content-Type: multipart/mixed; boundary="===============3996160552472078094=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/writeback] e5dbd33218: will-it-scale.per_process_ops -3.8% regression
Date: Wed, 28 Apr 2021 14:09:47 +0800
Message-ID: <96cb5b51-26d9-3bc3-987c-841b679ada74@intel.com>
In-Reply-To: <20210423124753.GA235567@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3996160552472078094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On 4/23/2021 8:47 PM, Matthew Wilcox wrote:
> On Fri, Apr 23, 2021 at 01:46:01PM +0800, kernel test robot wrote:
>> FYI, we noticed a -3.8% regression of will-it-scale.per_process_ops due =
to commit:
>> commit: e5dbd33218bd8d87ab69f730ab90aed5fab7eb26 ("mm/writeback: Add wai=
t_on_page_writeback_killable")
> That commit just adds a function.  It doesn't add any callers.  It must
> just be moving something around ...

The micro benchmark like will-it-scale is sensitive to the alignments =

(text/data), so I apply the data align debug patch and re-test, the =

regression reduced to -1.5%.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/cpufreq_gover=
nor/ucode:
lkp-csl-2sp9/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-=
ge5dbd33218bd-no-dynamic/gcc-9/16/process/mmap2/performance/0x5003006

commit:
 =C2=A0 a142a3781e3dc0c03a48688cac619c2684eed18f (fs/cachefiles: Remove =

wait_bit_key layout dependency)
 =C2=A0 86460bf788cb360a14811fadb3f94f9765ba5a23 (mm/writeback: Add =

wait_on_page_writeback_killable)

a142a3781e3dc0c0 86460bf788cb360a14811fadb3f
---------------- ---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
 =C2=A0=C2=A0 9089952=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.5%=C2=A0=C2=A0=C2=A0 8953838 will-it-scale.16.processes
 =C2=A0=C2=A0=C2=A0 568121=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -1.5%=C2=A0=C2=A0=C2=A0=C2=A0 559614 will-it-scale.per_p=
rocess_ops
 =C2=A0=C2=A0 9089952=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.5%=C2=A0=C2=A0=C2=A0 8953838=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 will-it-scale.workload
>> 39f985c8f667c80a e5dbd33218bd8d87ab69f730ab9
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>     9359770            -3.8%    9001769        will-it-scale.16.processes
>>      584985            -3.8%     562610        will-it-scale.per_process=
_ops
>>     9359770            -3.8%    9001769        will-it-scale.workload
>>       15996            -1.2%      15811        proc-vmstat.nr_kernel_sta=
ck
>>       23577 =C2=B1 10%     +18.5%      27937 =C2=B1  7%  softirqs.CPU48.=
SCHED
>>        5183 =C2=B1 41%     +47.2%       7630 =C2=B1  7%  interrupts.CPU1=
.NMI:Non-maskable_interrupts
>>        5183 =C2=B1 41%     +47.2%       7630 =C2=B1  7%  interrupts.CPU1=
.PMI:Performance_monitoring_interrupts
>>       54.33 =C2=B1 12%     +18.4%      64.33 =C2=B1  7%  perf-sched.wait=
_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.const=
prop.0.do_sys_poll
>>      153.34 =C2=B1 24%     -45.9%      83.00 =C2=B1 25%  perf-sched.wait=
_and_delay.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>      153.33 =C2=B1 24%     -45.9%      82.99 =C2=B1 25%  perf-sched.wait=
_time.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>   2.424e+10            -3.8%  2.332e+10        perf-stat.i.branch-instru=
ctions
>>        0.47            +3.7%       0.48        perf-stat.i.cpi
>>   2.529e+10            -4.0%  2.428e+10        perf-stat.i.dTLB-loads
>>    1.15e+10            -3.8%  1.106e+10        perf-stat.i.dTLB-stores
>>    54249733            -4.8%   51627939        perf-stat.i.iTLB-load-mis=
ses
>>   1.004e+11            -3.8%  9.661e+10        perf-stat.i.instructions
>>        2.15            -3.6%       2.07        perf-stat.i.ipc
>>      693.66            -3.9%     666.70        perf-stat.i.metric.M/sec
>>        0.46            +3.7%       0.48        perf-stat.overall.cpi
>>        2.15            -3.6%       2.08        perf-stat.overall.ipc
>>   2.416e+10            -3.8%  2.324e+10        perf-stat.ps.branch-instr=
uctions
>>    2.52e+10            -4.0%  2.419e+10        perf-stat.ps.dTLB-loads
>>   1.146e+10            -3.8%  1.102e+10        perf-stat.ps.dTLB-stores
>>    54065825            -4.8%   51454019        perf-stat.ps.iTLB-load-mi=
sses
>>   1.001e+11            -3.8%  9.628e+10        perf-stat.ps.instructions
>>   3.025e+13            -3.9%  2.908e+13        perf-stat.total.instructi=
ons
>>        0.89 =C2=B1 14%      -0.1        0.77 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.atime_needs_update.touch_atime.shmem_mmap.mmap_region.do_=
mmap
>>        0.14 =C2=B1 13%      -0.1        0.04 =C2=B1 71%  perf-profile.ch=
ildren.cycles-pp.common_mmap
>>        0.61 =C2=B1 12%      -0.1        0.52 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.common_file_perm
>>        0.21 =C2=B1  8%      -0.0        0.17 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.vma_set_page_prot
>>        0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.blocking_notifier_call_chain
>>        0.12 =C2=B1 14%      -0.0        0.09 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.get_mmap_base
>>        0.09 =C2=B1  8%      -0.0        0.07 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.vm_pgprot_modify
>>        0.13 =C2=B1 15%      +0.1        0.19 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.cap_capable
>>        0.03 =C2=B1102%      +0.1        0.12 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.munmap(a)plt
>>        0.14 =C2=B1 13%      +0.1        0.24 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.testcase
>>        0.33 =C2=B1 10%      -0.1        0.23 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.cap_vm_enough_memory
>>        0.13 =C2=B1 11%      -0.1        0.03 =C2=B1100%  perf-profile.se=
lf.cycles-pp.common_mmap
>>        0.48 =C2=B1 12%      -0.1        0.41 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.common_file_perm
>>        0.49 =C2=B1 12%      -0.1        0.43 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.vm_area_alloc
>>        0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.blocking_notifier_call_chain
>>        0.12 =C2=B1 13%      -0.0        0.09 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.get_mmap_base
>>        0.11 =C2=B1  8%      +0.0        0.16 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.__x64_sys_munmap
>>        0.11 =C2=B1 14%      +0.1        0.18 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.cap_capable
>>        0.12 =C2=B1 11%      +0.1        0.20 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.testcase
>>        0.01 =C2=B1223%      +0.1        0.11 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.munmap(a)plt
> I'm struggling to see anything in that that says anything other than
> "we did 3-4% less work".  Maybe someone else has something useful to
> say about it?
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing


--===============3996160552472078094==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgSGkg
TWF0dGhldyw8YnI+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9u
IDQvMjMvMjAyMSA4OjQ3IFBNLCBNYXR0aGV3IFdpbGNveAogICAgICB3cm90ZTo8YnI+CiAgICA8
L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1pZDoyMDIxMDQy
MzEyNDc1My5HQTIzNTU2N0BjYXNwZXIuaW5mcmFkZWFkLm9yZyI+CiAgICAgIDxwcmUgY2xhc3M9
Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDE6NDY6MDFQ
TSArMDgwMCwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6CjwvcHJlPgogICAgICA8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
PkZZSSwgd2Ugbm90aWNlZCBhIC0zLjglIHJlZ3Jlc3Npb24gb2Ygd2lsbC1pdC1zY2FsZS5wZXJf
cHJvY2Vzc19vcHMgZHVlIHRvIGNvbW1pdDoKY29tbWl0OiBlNWRiZDMzMjE4YmQ4ZDg3YWI2OWY3
MzBhYjkwYWVkNWZhYjdlYjI2ICgibW0vd3JpdGViYWNrOiBBZGQgd2FpdF9vbl9wYWdlX3dyaXRl
YmFja19raWxsYWJsZSIpCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xh
c3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+ClRoYXQgY29tbWl0IGp1c3QgYWRkcyBhIGZ1bmN0
aW9uLiAgSXQgZG9lc24ndCBhZGQgYW55IGNhbGxlcnMuICBJdCBtdXN0Cmp1c3QgYmUgbW92aW5n
IHNvbWV0aGluZyBhcm91bmQgLi4uCjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgog
ICAgVGhlIG1pY3JvIGJlbmNobWFyayBsaWtlIHdpbGwtaXQtc2NhbGUgaXMgc2Vuc2l0aXZlIHRv
IHRoZQogICAgYWxpZ25tZW50cyAodGV4dC9kYXRhKSwgc28gSSBhcHBseSB0aGUgZGF0YSBhbGln
biBkZWJ1ZyBwYXRjaCBhbmQKICAgIHJlLXRlc3QsIHRoZSByZWdyZXNzaW9uIHJlZHVjZWQgdG8g
LTEuNSUuIDxicj4KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+CnRib3hfZ3Jv
dXAvdGVzdGNhc2Uvcm9vdGZzL2tjb25maWcvY29tcGlsZXIvbnJfdGFzay9tb2RlL3Rlc3QvY3B1
ZnJlcV9nb3Zlcm5vci91Y29kZTo8YnI+CiAgICDCoApsa3AtY3NsLTJzcDkvd2lsbC1pdC1zY2Fs
ZS9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6L3g4Nl82NC1yaGVsLTguMy1nZTVkYmQz
MzIxOGJkLW5vLWR5bmFtaWMvZ2NjLTkvMTYvcHJvY2Vzcy9tbWFwMi9wZXJmb3JtYW5jZS8weDUw
MDMwMDY8YnI+CiAgICA8YnI+CiAgICBjb21taXQ6PGJyPgogICAgwqAgYTE0MmEzNzgxZTNkYzBj
MDNhNDg2ODhjYWM2MTljMjY4NGVlZDE4ZiAoZnMvY2FjaGVmaWxlczogUmVtb3ZlCiAgICB3YWl0
X2JpdF9rZXkgbGF5b3V0IGRlcGVuZGVuY3kpPGJyPgogICAgwqAgODY0NjBiZjc4OGNiMzYwYTE0
ODExZmFkYjNmOTRmOTc2NWJhNWEyMyAobW0vd3JpdGViYWNrOiBBZGQKICAgIHdhaXRfb25fcGFn
ZV93cml0ZWJhY2tfa2lsbGFibGUpPGJyPgogICAgPGJyPgogICAgYTE0MmEzNzgxZTNkYzBjMCA4
NjQ2MGJmNzg4Y2IzNjBhMTQ4MTFmYWRiM2Y8YnI+CiAgICAtLS0tLS0tLS0tLS0tLS0tIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KICAgIMKgwqDCoMKgwqDCoMKgwqAgJXN0ZGRldsKg
wqDCoMKgICVjaGFuZ2XCoMKgwqDCoMKgwqDCoMKgICVzdGRkZXY8YnI+CiAgICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFw8YnI+CiAgICDCoMKgIDkwODk5NTLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0x
LjUlwqDCoMKgIDg5NTM4MzjCoMKgwqDCoMKgwqDCoAogICAgd2lsbC1pdC1zY2FsZS4xNi5wcm9j
ZXNzZXM8YnI+CiAgICDCoMKgwqAgNTY4MTIxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMS41JcKg
wqDCoMKgIDU1OTYxNMKgwqDCoMKgwqDCoMKgCiAgICB3aWxsLWl0LXNjYWxlLnBlcl9wcm9jZXNz
X29wczxicj4KICAgIMKgwqAgOTA4OTk1MsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLTEuNSXCoMKg
wqAgODk1MzgzOMKgwqDCoMKgwqDCoMKgIHdpbGwtaXQtc2NhbGUud29ya2xvYWQ8YnI+CiAgICA8
c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyMywgNDMsIDc3KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1z
eXN0ZW0sCiAgICAgIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssIFJv
Ym90bywgT3h5Z2VuLCBVYnVudHUsCiAgICAgICZxdW90O0ZpcmEgU2FucyZxdW90OywgJnF1b3Q7
RHJvaWQgU2FucyZxdW90OywgJnF1b3Q7SGVsdmV0aWNhCiAgICAgIE5ldWUmcXVvdDssIHNhbnMt
c2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgZm9udC1zdHlsZTogbm9ybWFsOwogICAgICBmb250LXZh
cmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7CiAgICAg
IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRl
eHQtYWxpZ246CiAgICAgIHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTog
bm9uZTsgd2hpdGUtc3BhY2U6CiAgICAgIG5vcm1hbDsgd2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6
IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDoKICAgICAgMHB4OyBiYWNrZ3JvdW5kLWNv
bG9yOiByZ2IoMjQ0LCAyNDUsIDI0Nyk7CiAgICAgIHRleHQtZGVjb3JhdGlvbi10aGlja25lc3M6
IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5pdGlhbDsgdGV4dC1kZWNv
cmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5OiBpbmxpbmUKICAgICAgIWltcG9ydGFudDsg
ZmxvYXQ6IG5vbmU7Ij48L3NwYW4+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBj
aXRlPSJtaWQ6MjAyMTA0MjMxMjQ3NTMuR0EyMzU1NjdAY2FzcGVyLmluZnJhZGVhZC5vcmciPgog
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgo8L3ByZT4KICAgICAgPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIg
d3JhcD0iIj4zOWY5ODVjOGY2NjdjODBhIGU1ZGJkMzMyMThiZDhkODdhYjY5ZjczMGFiOSAKLS0t
LS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gCiAgICAgICAgICVzdGRk
ZXYgICAgICVjaGFuZ2UgICAgICAgICAlc3RkZGV2CiAgICAgICAgICAgICBcICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgXCAgCiAgIDkzNTk3NzAgICAgICAgICAgICAtMy44JSAgICA5MDAxNzY5
ICAgICAgICB3aWxsLWl0LXNjYWxlLjE2LnByb2Nlc3NlcwogICAgNTg0OTg1ICAgICAgICAgICAg
LTMuOCUgICAgIDU2MjYxMCAgICAgICAgd2lsbC1pdC1zY2FsZS5wZXJfcHJvY2Vzc19vcHMKICAg
OTM1OTc3MCAgICAgICAgICAgIC0zLjglICAgIDkwMDE3NjkgICAgICAgIHdpbGwtaXQtc2NhbGUu
d29ya2xvYWQKICAgICAxNTk5NiAgICAgICAgICAgIC0xLjIlICAgICAgMTU4MTEgICAgICAgIHBy
b2Mtdm1zdGF0Lm5yX2tlcm5lbF9zdGFjawogICAgIDIzNTc3IMKxIDEwJSAgICAgKzE4LjUlICAg
ICAgMjc5MzcgwrEgIDclICBzb2Z0aXJxcy5DUFU0OC5TQ0hFRAogICAgICA1MTgzIMKxIDQxJSAg
ICAgKzQ3LjIlICAgICAgIDc2MzAgwrEgIDclICBpbnRlcnJ1cHRzLkNQVTEuTk1JOk5vbi1tYXNr
YWJsZV9pbnRlcnJ1cHRzCiAgICAgIDUxODMgwrEgNDElICAgICArNDcuMiUgICAgICAgNzYzMCDC
sSAgNyUgIGludGVycnVwdHMuQ1BVMS5QTUk6UGVyZm9ybWFuY2VfbW9uaXRvcmluZ19pbnRlcnJ1
cHRzCiAgICAgNTQuMzMgwrEgMTIlICAgICArMTguNCUgICAgICA2NC4zMyDCsSAgNyUgIHBlcmYt
c2NoZWQud2FpdF9hbmRfZGVsYXkuY291bnQuc2NoZWR1bGVfaHJ0aW1lb3V0X3JhbmdlX2Nsb2Nr
LnBvbGxfc2NoZWR1bGVfdGltZW91dC5jb25zdHByb3AuMC5kb19zeXNfcG9sbAogICAgMTUzLjM0
IMKxIDI0JSAgICAgLTQ1LjklICAgICAgODMuMDAgwrEgMjUlICBwZXJmLXNjaGVkLndhaXRfYW5k
X2RlbGF5Lm1heC5tcy5zY2hlZHVsZV90aW1lb3V0LnJjdV9ncF9rdGhyZWFkLmt0aHJlYWQucmV0
X2Zyb21fZm9yawogICAgMTUzLjMzIMKxIDI0JSAgICAgLTQ1LjklICAgICAgODIuOTkgwrEgMjUl
ICBwZXJmLXNjaGVkLndhaXRfdGltZS5tYXgubXMuc2NoZWR1bGVfdGltZW91dC5yY3VfZ3Bfa3Ro
cmVhZC5rdGhyZWFkLnJldF9mcm9tX2ZvcmsKIDIuNDI0ZSsxMCAgICAgICAgICAgIC0zLjglICAy
LjMzMmUrMTAgICAgICAgIHBlcmYtc3RhdC5pLmJyYW5jaC1pbnN0cnVjdGlvbnMKICAgICAgMC40
NyAgICAgICAgICAgICszLjclICAgICAgIDAuNDggICAgICAgIHBlcmYtc3RhdC5pLmNwaQogMi41
MjllKzEwICAgICAgICAgICAgLTQuMCUgIDIuNDI4ZSsxMCAgICAgICAgcGVyZi1zdGF0LmkuZFRM
Qi1sb2FkcwogIDEuMTVlKzEwICAgICAgICAgICAgLTMuOCUgIDEuMTA2ZSsxMCAgICAgICAgcGVy
Zi1zdGF0LmkuZFRMQi1zdG9yZXMKICA1NDI0OTczMyAgICAgICAgICAgIC00LjglICAgNTE2Mjc5
MzkgICAgICAgIHBlcmYtc3RhdC5pLmlUTEItbG9hZC1taXNzZXMKIDEuMDA0ZSsxMSAgICAgICAg
ICAgIC0zLjglICA5LjY2MWUrMTAgICAgICAgIHBlcmYtc3RhdC5pLmluc3RydWN0aW9ucwogICAg
ICAyLjE1ICAgICAgICAgICAgLTMuNiUgICAgICAgMi4wNyAgICAgICAgcGVyZi1zdGF0LmkuaXBj
CiAgICA2OTMuNjYgICAgICAgICAgICAtMy45JSAgICAgNjY2LjcwICAgICAgICBwZXJmLXN0YXQu
aS5tZXRyaWMuTS9zZWMKICAgICAgMC40NiAgICAgICAgICAgICszLjclICAgICAgIDAuNDggICAg
ICAgIHBlcmYtc3RhdC5vdmVyYWxsLmNwaQogICAgICAyLjE1ICAgICAgICAgICAgLTMuNiUgICAg
ICAgMi4wOCAgICAgICAgcGVyZi1zdGF0Lm92ZXJhbGwuaXBjCiAyLjQxNmUrMTAgICAgICAgICAg
ICAtMy44JSAgMi4zMjRlKzEwICAgICAgICBwZXJmLXN0YXQucHMuYnJhbmNoLWluc3RydWN0aW9u
cwogIDIuNTJlKzEwICAgICAgICAgICAgLTQuMCUgIDIuNDE5ZSsxMCAgICAgICAgcGVyZi1zdGF0
LnBzLmRUTEItbG9hZHMKIDEuMTQ2ZSsxMCAgICAgICAgICAgIC0zLjglICAxLjEwMmUrMTAgICAg
ICAgIHBlcmYtc3RhdC5wcy5kVExCLXN0b3JlcwogIDU0MDY1ODI1ICAgICAgICAgICAgLTQuOCUg
ICA1MTQ1NDAxOSAgICAgICAgcGVyZi1zdGF0LnBzLmlUTEItbG9hZC1taXNzZXMKIDEuMDAxZSsx
MSAgICAgICAgICAgIC0zLjglICA5LjYyOGUrMTAgICAgICAgIHBlcmYtc3RhdC5wcy5pbnN0cnVj
dGlvbnMKIDMuMDI1ZSsxMyAgICAgICAgICAgIC0zLjklICAyLjkwOGUrMTMgICAgICAgIHBlcmYt
c3RhdC50b3RhbC5pbnN0cnVjdGlvbnMKICAgICAgMC44OSDCsSAxNCUgICAgICAtMC4xICAgICAg
ICAwLjc3IMKxIDExJSAgcGVyZi1wcm9maWxlLmNhbGx0cmFjZS5jeWNsZXMtcHAuYXRpbWVfbmVl
ZHNfdXBkYXRlLnRvdWNoX2F0aW1lLnNobWVtX21tYXAubW1hcF9yZWdpb24uZG9fbW1hcAogICAg
ICAwLjE0IMKxIDEzJSAgICAgIC0wLjEgICAgICAgIDAuMDQgwrEgNzElICBwZXJmLXByb2ZpbGUu
Y2hpbGRyZW4uY3ljbGVzLXBwLmNvbW1vbl9tbWFwCiAgICAgIDAuNjEgwrEgMTIlICAgICAgLTAu
MSAgICAgICAgMC41MiDCsSAxMiUgIHBlcmYtcHJvZmlsZS5jaGlsZHJlbi5jeWNsZXMtcHAuY29t
bW9uX2ZpbGVfcGVybQogICAgICAwLjIxIMKxICA4JSAgICAgIC0wLjAgICAgICAgIDAuMTcgwrEg
MTElICBwZXJmLXByb2ZpbGUuY2hpbGRyZW4uY3ljbGVzLXBwLnZtYV9zZXRfcGFnZV9wcm90CiAg
ICAgIDAuMTIgwrEgIDglICAgICAgLTAuMCAgICAgICAgMC4wOSDCsSAxMiUgIHBlcmYtcHJvZmls
ZS5jaGlsZHJlbi5jeWNsZXMtcHAuYmxvY2tpbmdfbm90aWZpZXJfY2FsbF9jaGFpbgogICAgICAw
LjEyIMKxIDE0JSAgICAgIC0wLjAgICAgICAgIDAuMDkgwrEgMTUlICBwZXJmLXByb2ZpbGUuY2hp
bGRyZW4uY3ljbGVzLXBwLmdldF9tbWFwX2Jhc2UKICAgICAgMC4wOSDCsSAgOCUgICAgICAtMC4w
ICAgICAgICAwLjA3IMKxIDExJSAgcGVyZi1wcm9maWxlLmNoaWxkcmVuLmN5Y2xlcy1wcC52bV9w
Z3Byb3RfbW9kaWZ5CiAgICAgIDAuMTMgwrEgMTUlICAgICAgKzAuMSAgICAgICAgMC4xOSDCsSAg
OCUgIHBlcmYtcHJvZmlsZS5jaGlsZHJlbi5jeWNsZXMtcHAuY2FwX2NhcGFibGUKICAgICAgMC4w
MyDCsTEwMiUgICAgICArMC4xICAgICAgICAwLjEyIMKxIDEyJSAgcGVyZi1wcm9maWxlLmNoaWxk
cmVuLmN5Y2xlcy1wcC5tdW5tYXBAcGx0CiAgICAgIDAuMTQgwrEgMTMlICAgICAgKzAuMSAgICAg
ICAgMC4yNCDCsSAgNiUgIHBlcmYtcHJvZmlsZS5jaGlsZHJlbi5jeWNsZXMtcHAudGVzdGNhc2UK
ICAgICAgMC4zMyDCsSAxMCUgICAgICAtMC4xICAgICAgICAwLjIzIMKxIDEwJSAgcGVyZi1wcm9m
aWxlLnNlbGYuY3ljbGVzLXBwLmNhcF92bV9lbm91Z2hfbWVtb3J5CiAgICAgIDAuMTMgwrEgMTEl
ICAgICAgLTAuMSAgICAgICAgMC4wMyDCsTEwMCUgIHBlcmYtcHJvZmlsZS5zZWxmLmN5Y2xlcy1w
cC5jb21tb25fbW1hcAogICAgICAwLjQ4IMKxIDEyJSAgICAgIC0wLjEgICAgICAgIDAuNDEgwrEg
MTIlICBwZXJmLXByb2ZpbGUuc2VsZi5jeWNsZXMtcHAuY29tbW9uX2ZpbGVfcGVybQogICAgICAw
LjQ5IMKxIDEyJSAgICAgIC0wLjEgICAgICAgIDAuNDMgwrEgMTMlICBwZXJmLXByb2ZpbGUuc2Vs
Zi5jeWNsZXMtcHAudm1fYXJlYV9hbGxvYwogICAgICAwLjEyIMKxICA4JSAgICAgIC0wLjAgICAg
ICAgIDAuMDkgwrEgMTIlICBwZXJmLXByb2ZpbGUuc2VsZi5jeWNsZXMtcHAuYmxvY2tpbmdfbm90
aWZpZXJfY2FsbF9jaGFpbgogICAgICAwLjEyIMKxIDEzJSAgICAgIC0wLjAgICAgICAgIDAuMDkg
wrEgMTQlICBwZXJmLXByb2ZpbGUuc2VsZi5jeWNsZXMtcHAuZ2V0X21tYXBfYmFzZQogICAgICAw
LjExIMKxICA4JSAgICAgICswLjAgICAgICAgIDAuMTYgwrEgMTAlICBwZXJmLXByb2ZpbGUuc2Vs
Zi5jeWNsZXMtcHAuX194NjRfc3lzX211bm1hcAogICAgICAwLjExIMKxIDE0JSAgICAgICswLjEg
ICAgICAgIDAuMTggwrEgIDglICBwZXJmLXByb2ZpbGUuc2VsZi5jeWNsZXMtcHAuY2FwX2NhcGFi
bGUKICAgICAgMC4xMiDCsSAxMSUgICAgICArMC4xICAgICAgICAwLjIwIMKxICA2JSAgcGVyZi1w
cm9maWxlLnNlbGYuY3ljbGVzLXBwLnRlc3RjYXNlCiAgICAgIDAuMDEgwrEyMjMlICAgICAgKzAu
MSAgICAgICAgMC4xMSDCsSAxMyUgIHBlcmYtcHJvZmlsZS5zZWxmLmN5Y2xlcy1wcC5tdW5tYXBA
cGx0CjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+CkknbSBzdHJ1Z2dsaW5nIHRvIHNlZSBhbnl0aGluZyBpbiB0aGF0IHRo
YXQgc2F5cyBhbnl0aGluZyBvdGhlciB0aGFuCiJ3ZSBkaWQgMy00JSBsZXNzIHdvcmsiLiAgTWF5
YmUgc29tZW9uZSBlbHNlIGhhcyBzb21ldGhpbmcgdXNlZnVsIHRvCnNheSBhYm91dCBpdD8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTEtQIG1haWxpbmcg
bGlzdCAtLSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86
bGtwQGxpc3RzLjAxLm9yZyI+bGtwQGxpc3RzLjAxLm9yZzwvYT4KVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJt
YWlsdG86bGtwLWxlYXZlQGxpc3RzLjAxLm9yZyI+bGtwLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4K
PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgICA8cHJlIGNsYXNzPSJtb3otc2ln
bmF0dXJlIiBjb2xzPSI3MiI+LS0gClpoZW5nanVuIFhpbmc8L3ByZT4KICA8L2JvZHk+CjwvaHRt
bD4K

--===============3996160552472078094==--

