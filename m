Content-Type: multipart/mixed; boundary="===============8777753150561312767=="
MIME-Version: 1.0
From: Pranith Kumar <bobby.prani@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 0eb885afb20: -25.8% softirqs.RCU
Date: Thu, 21 Aug 2014 13:52:30 -0400
Message-ID: <CAJhHMCA-R6L6pwyhXZZTWXjc-MpajBMzK4_uLv9Eqb5v+OKrRQ@mail.gmail.com>
In-Reply-To: <20140821135035.GA19246@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8777753150561312767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2014 at 9:50 AM, Fengguang Wu <fengguang.wu@intel.com>
wrote:

> Hi Pranith,
>
> FYI, these changes look nice:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> rcu/dev
> commit 0eb885afb20317016670c1c5dd3a436c91e1e910 ("rcu: Use
> rcu_gp_kthread_wake() to wake up grace period kthreads")
>
> test case: lkp-a04/aim7/400-disk_rr
>
> It's an in-memory aim7/disk_rr test.
> lkp-a04 is an Atom micro server with 8G Memory.
>
> 5db6a289a3a0a69  0eb885afb20317016670c1c5d
> ---------------  -------------------------
>     150860 =C2=B1 1%     -25.8%     111937 =C2=B1 1%  TOTAL softirqs.RCU
>       2809 =C2=B1 1%     -12.5%       2457 =C2=B1 1%  TOTAL vmstat.system=
.cs
>       4202 =C2=B1 1%      -6.9%       3911 =C2=B1 1%  TOTAL vmstat.system=
.in
>     212421 =C2=B1 2%      -7.7%     196035 =C2=B1 3%  TOTAL
> time.involuntary_context_switches
>

Great! Thanks for the analysis.

-- =

Pranith

--===============8777753150561312767==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBUaHUsIEF1ZyAyMSwgMjAxNCBhdCA5OjUwIEFNLCBGZW5n
Z3VhbmcgV3UgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86ZmVuZ2d1YW5nLnd1
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmZlbmdndWFuZy53dUBpbnRlbC5jb208L2E+Jmd0
Ozwvc3Bhbj4gd3JvdGU6PGJyPgoKPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+SGkgUHJhbml0aCw8YnI+Cjxicj4KRllJLCB0aGVzZSBjaGFuZ2VzIGxvb2sgbmlj
ZTo8YnI+Cjxicj4KZ2l0Oi8vPGEgaHJlZj0iaHR0cDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9wYXVsbWNrL2xpbnV4LXJjdS5naXQiIHRhcmdldD0iX2JsYW5rIj5n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGF1bG1jay9saW51eC1yY3Uu
Z2l0PC9hPiByY3UvZGV2PGJyPgpjb21taXQgMGViODg1YWZiMjAzMTcwMTY2NzBjMWM1ZGQzYTQz
NmM5MWUxZTkxMCAoJnF1b3Q7cmN1OiBVc2UgcmN1X2dwX2t0aHJlYWRfd2FrZSgpIHRvIHdha2Ug
dXAgZ3JhY2UgcGVyaW9kIGt0aHJlYWRzJnF1b3Q7KTxicj4KPGJyPgp0ZXN0IGNhc2U6IGxrcC1h
MDQvYWltNy80MDAtZGlza19ycjxicj4KPGJyPgpJdCYjMzk7cyBhbiBpbi1tZW1vcnkgYWltNy9k
aXNrX3JyIHRlc3QuPGJyPgpsa3AtYTA0IGlzIGFuIEF0b20gbWljcm8gc2VydmVyIHdpdGggOEcg
TWVtb3J5Ljxicj4KPGJyPgo1ZGI2YTI4OWEzYTBhNjnCoCAwZWI4ODVhZmIyMDMxNzAxNjY3MGMx
YzVkPGJyPgotLS0tLS0tLS0tLS0tLS3CoCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPgrC
oCDCoCAxNTA4NjAgwrEgMSXCoCDCoCDCoC0yNS44JcKgIMKgIMKgMTExOTM3IMKxIDElwqAgVE9U
QUwgc29mdGlycXMuUkNVPGJyPgrCoCDCoCDCoCAyODA5IMKxIDElwqAgwqAgwqAtMTIuNSXCoCDC
oCDCoCDCoDI0NTcgwrEgMSXCoCBUT1RBTCB2bXN0YXQuc3lzdGVtLmNzPGJyPgrCoCDCoCDCoCA0
MjAyIMKxIDElwqAgwqAgwqAgLTYuOSXCoCDCoCDCoCDCoDM5MTEgwrEgMSXCoCBUT1RBTCA8YSBo
cmVmPSJodHRwOi8vdm1zdGF0LnN5c3RlbS5pbiIgdGFyZ2V0PSJfYmxhbmsiPnZtc3RhdC5zeXN0
ZW0uaW48L2E+PGJyPgrCoCDCoCAyMTI0MjEgwrEgMiXCoCDCoCDCoCAtNy43JcKgIMKgIMKgMTk2
MDM1IMKxIDMlwqAgVE9UQUwgdGltZS5pbnZvbHVudGFyeV9jb250ZXh0X3N3aXRjaGVzPGJyPjwv
YmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkdyZWF0ISBUaGFua3MgZm9yIHRoZSBhbmFs
eXNpcy48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+LS0gPGJyPlByYW5pdGgKPC9kaXY+
PC9kaXY+Cg==

--===============8777753150561312767==--

