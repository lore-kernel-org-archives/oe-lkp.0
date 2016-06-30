Content-Type: multipart/mixed; boundary="===============4110220686548028368=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [sched] 325e2efd8c: BUG: unable to handle kernel paging request at ffff88000ea0befc
Date: Wed, 29 Jun 2016 19:11:54 -0700
Message-ID: <CALCETrWnfh-h=05gs55x+RaodLb2T52Vds-Z2Sjz93HodM7n+g@mail.gmail.com>
In-Reply-To: <20160630015612.GE8951@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4110220686548028368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Jun 29, 2016 6:58 PM, "kernel test robot" <xiaolong.ye@intel.com> wrot=
e:
>
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git
x86/vmap_stack
> commit 325e2efd8c4ae6b4bf328e0ede2acfe8b3b48e79 ("sched: Free the stack
early if CONFIG_THREAD_INFO_IN_TASK")
>

This appears to still be the older version of the branch and is missing
Oleg's fix.  It should be fixed now.

--Andy

--===============4110220686548028368==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgZGlyPSJsdHIiPjxicj4KT24gSnVuIDI5LCAyMDE2IDY6NTggUE0sICZxdW90O2tlcm5lbCB0
ZXN0IHJvYm90JnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86eGlhb2xvbmcueWVAaW50ZWwuY29t
Ij54aWFvbG9uZy55ZUBpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+CiZndDs8YnI+CiZndDs8
YnI+CiZndDsgRllJLCB3ZSBub3RpY2VkIHRoZSBmb2xsb3dpbmcgY29tbWl0Ojxicj4KJmd0Ozxi
cj4KJmd0OyA8YSBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9sdXRvL2xpbnV4LmdpdCI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbHV0by9saW51eC5naXQ8L2E+IHg4Ni92bWFwX3N0YWNrPGJyPgomZ3Q7
IGNvbW1pdCAzMjVlMmVmZDhjNGFlNmI0YmYzMjhlMGVkZTJhY2ZlOGIzYjQ4ZTc5ICgmcXVvdDtz
Y2hlZDogRnJlZSB0aGUgc3RhY2sgZWFybHkgaWYgQ09ORklHX1RIUkVBRF9JTkZPX0lOX1RBU0sm
cXVvdDspPGJyPgomZ3Q7PC9wPgo8cCBkaXI9Imx0ciI+VGhpcyBhcHBlYXJzIHRvIHN0aWxsIGJl
IHRoZSBvbGRlciB2ZXJzaW9uIG9mIHRoZSBicmFuY2ggYW5kIGlzIG1pc3NpbmcgT2xlZyYjMzk7
cyBmaXguwqAgSXQgc2hvdWxkIGJlIGZpeGVkIG5vdy48L3A+CjxwIGRpcj0ibHRyIj4tLUFuZHk8
L3A+Cg==

--===============4110220686548028368==--

