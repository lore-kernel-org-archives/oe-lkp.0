Content-Type: multipart/mixed; boundary="===============0258452751617089497=="
MIME-Version: 1.0
From: Dan Streetman <ddstreet@ieee.org>
To: lkp@lists.01.org
Subject: Re: [zswap] c00ed16a9eb: zswap: zpool creation failed
Date: Fri, 03 Jul 2015 01:51:11 -0400
Message-ID: <CALZtONCrnVB3FzdDp7tC=VUOEQfu7iLabEPygewLPaLjp6HzvQ@mail.gmail.com>
In-Reply-To: <1435812982.5489.101.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0258452751617089497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Jul 2, 2015 12:56 AM, "Huang Ying" <ying.huang@intel.com> wrote:
>
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit c00ed16a9eb98a7fc076e227bdd95c1451ca1e6e ("zswap: runtime
enable/disable")
>
> The following new message in kernel log may make end user confusing:
>
> [    5.296308] zswap: loading zswap
> [    5.299289] zpool: creating pool type zbud
> [    5.302081] zpool: no driver for type zbud
> [    5.310432] zswap: zbud zpool not available
> [    5.313658] zswap: zpool creation failed

I don't think this is related to the enable/disable commit, it can't load
zbud because you have it as a module but I assume not built into the initrd.

With that config, there is nothing zswap or zpool can do at boot time to
load zbud, if you don't have it in the initrd.  I do have patches that I'm
going to rebase and resend that will allow changing zswap's zpool or
compressor at runtime, so you wouldn't need to add it to the initrd.

>
> Thanks,
> Ying Huang

--===============0258452751617089497==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgZGlyPSJsdHIiPjxicj4KT24gSnVsIDIsIDIwMTUgMTI6NTYgQU0sICZxdW90O0h1YW5nIFlp
bmcmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp5aW5nLmh1YW5nQGludGVsLmNvbSI+eWluZy5o
dWFuZ0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+CiZndDs8YnI+CiZndDsgRllJLCB3ZSBu
b3RpY2VkIHRoZSBiZWxvdyBjaGFuZ2VzIG9uPGJyPgomZ3Q7PGJyPgomZ3Q7IGdpdDovLzxhIGhy
ZWY9Imh0dHA6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0Ij5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0PC9hPiBtYXN0ZXI8YnI+CiZndDsgY29tbWl0IGMwMGVkMTZhOWViOThh
N2ZjMDc2ZTIyN2JkZDk1YzE0NTFjYTFlNmUgKCZxdW90O3pzd2FwOiBydW50aW1lIGVuYWJsZS9k
aXNhYmxlJnF1b3Q7KTxicj4KJmd0Ozxicj4KJmd0OyBUaGUgZm9sbG93aW5nIG5ldyBtZXNzYWdl
IGluIGtlcm5lbCBsb2cgbWF5IG1ha2UgZW5kIHVzZXIgY29uZnVzaW5nOjxicj4KJmd0Ozxicj4K
Jmd0OyBbwqAgwqAgNS4yOTYzMDhdIHpzd2FwOiBsb2FkaW5nIHpzd2FwPGJyPgomZ3Q7IFvCoCDC
oCA1LjI5OTI4OV0genBvb2w6IGNyZWF0aW5nIHBvb2wgdHlwZSB6YnVkPGJyPgomZ3Q7IFvCoCDC
oCA1LjMwMjA4MV0genBvb2w6IG5vIGRyaXZlciBmb3IgdHlwZSB6YnVkPGJyPgomZ3Q7IFvCoCDC
oCA1LjMxMDQzMl0genN3YXA6IHpidWQgenBvb2wgbm90IGF2YWlsYWJsZTxicj4KJmd0OyBbwqAg
wqAgNS4zMTM2NThdIHpzd2FwOiB6cG9vbCBjcmVhdGlvbiBmYWlsZWQ8L3A+CjxwIGRpcj0ibHRy
Ij5JIGRvbiYjMzk7dCB0aGluayB0aGlzIGlzIHJlbGF0ZWQgdG8gdGhlIGVuYWJsZS9kaXNhYmxl
IGNvbW1pdCwgaXQgY2FuJiMzOTt0IGxvYWQgemJ1ZCBiZWNhdXNlIHlvdSBoYXZlIGl0IGFzIGEg
bW9kdWxlIGJ1dCBJIGFzc3VtZSBub3QgYnVpbHQgaW50byB0aGUgaW5pdHJkLjwvcD4KPHAgZGly
PSJsdHIiPldpdGggdGhhdCBjb25maWcsIHRoZXJlIGlzIG5vdGhpbmcgenN3YXAgb3IgenBvb2wg
Y2FuIGRvIGF0IGJvb3QgdGltZSB0byBsb2FkIHpidWQsIGlmIHlvdSBkb24mIzM5O3QgaGF2ZSBp
dCBpbiB0aGUgaW5pdHJkLsKgIEkgZG8gaGF2ZSBwYXRjaGVzIHRoYXQgSSYjMzk7bSBnb2luZyB0
byByZWJhc2UgYW5kIHJlc2VuZCB0aGF0IHdpbGwgYWxsb3cgY2hhbmdpbmcgenN3YXAmIzM5O3Mg
enBvb2wgb3IgY29tcHJlc3NvciBhdCBydW50aW1lLCBzbyB5b3Ugd291bGRuJiMzOTt0IG5lZWQg
dG8gYWRkIGl0IHRvIHRoZSBpbml0cmQuwqAgPC9wPgo8cCBkaXI9Imx0ciI+Jmd0Ozxicj4KJmd0
OyBUaGFua3MsPGJyPgomZ3Q7IFlpbmcgSHVhbmc8YnI+CjwvcD4K

--===============0258452751617089497==--

