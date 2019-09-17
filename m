Content-Type: multipart/mixed; boundary="===============7343842361882856784=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Tue, 17 Sep 2019 16:59:53 +0800
Message-ID: <a452f311-67f7-3937-cc1e-8126f847d299@intel.com>
In-Reply-To: <20190916172945.GB1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7343842361882856784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9/17/19 1:29 AM, Al Viro wrote:
> On Mon, Sep 16, 2019 at 06:16:06PM +0100, Al Viro wrote:
>> On Sun, Sep 15, 2019 at 08:44:05PM -0700, Linus Torvalds wrote:
>>> On Sun, Sep 15, 2019 at 8:04 PM Al Viro <viro@zeniv.linux.org.uk> wro=
te:
>>>> Perhaps lockref_get_nested(struct lockref *lockref, unsigned int subcl=
ass)?
>>>> With s/spin_lock/spin_lock_nested/ in the body...
>>> Sure. Under the usual CONFIG_DEBUG_LOCK_ALLOC, with the non-debug case
>>> just turning into a regular lockref_get().
>>>
>>> Sounds fine to me.
>> Done and force-pushed into vfs.git#fixes
> BTW, folks, I would really appreciate more people _testing_ that thing;
> it survives the local beating, but...

Hi,

0day tested vfs.git#fixes and found that the problem no longer exists.

Best Regards,
Rong Chen

--===============7343842361882856784==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHNtYXJ0dGVt
cGxhdGVpbnNlcnRlZD0idHJ1ZSI+CiAgICA8YnI+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJt
b3otY2l0ZS1wcmVmaXgiPk9uIDkvMTcvMTkgMToyOSBBTSwgQWwgVmlybyB3cm90ZTo8YnI+CiAg
ICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1pZDoyMDE5
MDkxNjE3Mjk0NS5HQjExMzFAWmVuSVYubGludXgub3JnLnVrIj4KICAgICAgPHByZSBjbGFzcz0i
bW96LXF1b3RlLXByZSIgd3JhcD0iIj5PbiBNb24sIFNlcCAxNiwgMjAxOSBhdCAwNjoxNjowNlBN
ICswMTAwLCBBbCBWaXJvIHdyb3RlOgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5PbiBTdW4sIFNl
cCAxNSwgMjAxOSBhdCAwODo0NDowNVBNIC0wNzAwLCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPC9w
cmU+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk9uIFN1biwgU2VwIDE1LCAyMDE5IGF0IDg6MDQgUE0g
QWwgVmlybyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86dmly
b0B6ZW5pdi5saW51eC5vcmcudWsiPiZsdDt2aXJvQHplbml2LmxpbnV4Lm9yZy51ayZndDs8L2E+
IHdyb3RlOgo8L3ByZT4KICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAg
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpQZXJoYXBzIGxvY2tyZWZf
Z2V0X25lc3RlZChzdHJ1Y3QgbG9ja3JlZiAqbG9ja3JlZiwgdW5zaWduZWQgaW50IHN1YmNsYXNz
KT8KV2l0aCBzL3NwaW5fbG9jay9zcGluX2xvY2tfbmVzdGVkLyBpbiB0aGUgYm9keS4uLgo8L3By
ZT4KICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+ClN1cmUuIFVuZGVyIHRoZSB1c3VhbCBDT05GSUdfREVCVUdfTE9DS19B
TExPQywgd2l0aCB0aGUgbm9uLWRlYnVnIGNhc2UKanVzdCB0dXJuaW5nIGludG8gYSByZWd1bGFy
IGxvY2tyZWZfZ2V0KCkuCgpTb3VuZHMgZmluZSB0byBtZS4KPC9wcmU+CiAgICAgICAgPC9ibG9j
a3F1b3RlPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CkRvbmUg
YW5kIGZvcmNlLXB1c2hlZCBpbnRvIHZmcy5naXQjZml4ZXMKPC9wcmU+CiAgICAgIDwvYmxvY2tx
dW90ZT4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KQlRXLCBmb2xr
cywgSSB3b3VsZCByZWFsbHkgYXBwcmVjaWF0ZSBtb3JlIHBlb3BsZSBfdGVzdGluZ18gdGhhdCB0
aGluZzsKaXQgc3Vydml2ZXMgdGhlIGxvY2FsIGJlYXRpbmcsIGJ1dC4uLgo8L3ByZT4KICAgIDwv
YmxvY2txdW90ZT4KICAgIDxicj4KICAgIEhpLDxicj4KICAgIDxicj4KICAgIDBkYXkgdGVzdGVk
IHZmcy5naXQjZml4ZXMgYW5kIGZvdW5kIHRoYXQgPHNwYW4gaWQ9IndfMzYiIGNsYXNzPSIiPjwv
c3Bhbj48c3BhbgogICAgICBpZD0id18zNyI+dGhlIDwvc3Bhbj48c3BhbiBpZD0id18zOCIgY2xh
c3M9IiI+cHJvYmxlbSA8L3NwYW4+PHNwYW4KICAgICAgaWQ9IndfMzkiIGNsYXNzPSIiPm5vIDwv
c3Bhbj48c3BhbiBpZD0id180MCIgY2xhc3M9IiI+bG9uZ2VyIDwvc3Bhbj48c3BhbgogICAgICBp
ZD0id180MSIgY2xhc3M9IiI+ZXhpc3RzPC9zcGFuPi4gPGJyPgogICAgPGJyPgogICAgQmVzdCBS
ZWdhcmRzLDxicj4KICAgIFJvbmcgQ2hlbjxicj4KICA8L2JvZHk+CjwvaHRtbD4K

--===============7343842361882856784==--

