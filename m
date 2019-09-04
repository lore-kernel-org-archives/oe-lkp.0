Content-Type: multipart/mixed; boundary="===============0339014012761112351=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 04 Sep 2019 22:30:46 +0800
Message-ID: <888fa0f3-7078-d920-c4d1-89970b452b97@intel.com>
In-Reply-To: <33d3ce15-6221-bd96-3f26-b710e4da6b1a@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0339014012761112351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On 9/4/2019 4:43 PM, Thomas Zimmermann wrote:
> Hi
>
> Am 04.09.19 um 10:35 schrieb Feng Tang:
>> Hi Daniel,
>>
>> On Wed, Sep 04, 2019 at 10:11:11AM +0200, Daniel Vetter wrote:
>>> On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>>> Hi
>>>>
>>>> Am 04.09.19 um 08:27 schrieb Feng Tang:
>>>>>> Thank you for testing. But don't get too excited, because the patch
>>>>>> simulates a bug that was present in the original mgag200 code. A
>>>>>> significant number of frames are simply skipped. That is apparently =
the
>>>>>> reason why it's faster.
>>>>> Thanks for the detailed info, so the original code skips time-consumi=
ng
>>>>> work inside atomic context on purpose. Is there any space to optmise =
it?
>>>>> If 2 scheduled update worker are handled at almost same time, can one=
 be
>>>>> skipped?
>>>> To my knowledge, there's only one instance of the worker. Re-scheduling
>>>> the worker before a previous instance started, will not create a second
>>>> instance. The worker's instance will complete all pending updates. So =
in
>>>> some way, skipping workers already happens.
>>> So I think that the most often fbcon update from atomic context is the
>>> blinking cursor. If you disable that one you should be back to the old
>>> performance level I think, since just writing to dmesg is from process
>>> context, so shouldn't change.
>> Hmm, then for the old driver, it should also do the most update in
>> non-atomic context?
>>
>> One other thing is, I profiled that updating a 3MB shadow buffer needs
>> 20 ms, which transfer to 150 MB/s bandwidth. Could it be related with
>> the cache setting of DRM shadow buffer? say the orginal code use a
>> cachable buffer?
>>
>>
>>> https://unix.stackexchange.com/questions/3759/how-to-stop-cursor-from-b=
linking
>>>
>>> Bunch of tricks, but tbh I haven't tested them.
>> Thomas has suggested to disable curson by
>> 	echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>>
>> We tried that way, and no change for the performance data.
> There are several ways of disabling the cursor. On my test system, I ente=
red
>
>    tput civis
>
> before the test and got better performance. Did you try this as well?

There's no obvious change on our system.

Best Regards,
Rong Chen

>
> Best regards
> Thomas
>
>> Thanks,
>> Feng
>>
>>> In any case, I still strongly advice you don't print anything to dmesg
>>> or fbcon while benchmarking, because dmesg/printf are anything but
>>> fast, especially if a gpu driver is involved. There's some efforts to
>>> make the dmesg/printk side less painful (untangling the console_lock
>>> from printk), but fundamentally printing to the gpu from the kernel
>>> through dmesg/fbcon won't be cheap. It's just not something we
>>> optimize beyond "make sure it works for emergencies".
>>> -Daniel
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> Thanks,
>>>>> Feng
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel(a)lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>>> HRB 21284 (AG N=C3=BCrnberg)
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel(a)lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>>
>>> -- =

>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============0339014012761112351==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgSGkgVGhvbWFzLDxicj4KICAgIDxicj4KICAg
IDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+T24gOS80LzIwMTkgNDo0MyBQTSwgVGhvbWFz
IFppbW1lcm1hbm4KICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MzNkM2NlMTUtNjIyMS1iZDk2LTNmMjYtYjcxMGU0
ZGE2YjFhQHN1c2UuZGUiPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
PkhpCgpBbSAwNC4wOS4xOSB1bSAxMDozNSBzY2hyaWViIEZlbmcgVGFuZzoKPC9wcmU+CiAgICAg
IDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1w
cmUiIHdyYXA9IiI+SGkgRGFuaWVsLAoKT24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMTA6MTE6MTFB
TSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPC9wcmU+CiAgICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
Pk9uIFdlZCwgU2VwIDQsIDIwMTkgYXQgODo1MyBBTSBUaG9tYXMgWmltbWVybWFubiA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86dHppbW1lcm1hbm5Ac3VzZS5k
ZSI+Jmx0O3R6aW1tZXJtYW5uQHN1c2UuZGUmZ3Q7PC9hPiB3cm90ZToKPC9wcmU+CiAgICAgICAg
ICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1
b3RlLXByZSIgd3JhcD0iIj4KSGkKCkFtIDA0LjA5LjE5IHVtIDA4OjI3IHNjaHJpZWIgRmVuZyBU
YW5nOgo8L3ByZT4KICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAg
ICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPlRoYW5rIHlvdSBmb3IgdGVzdGluZy4gQnV0IGRvbid0
IGdldCB0b28gZXhjaXRlZCwgYmVjYXVzZSB0aGUgcGF0Y2gKc2ltdWxhdGVzIGEgYnVnIHRoYXQg
d2FzIHByZXNlbnQgaW4gdGhlIG9yaWdpbmFsIG1nYWcyMDAgY29kZS4gQQpzaWduaWZpY2FudCBu
dW1iZXIgb2YgZnJhbWVzIGFyZSBzaW1wbHkgc2tpcHBlZC4gVGhhdCBpcyBhcHBhcmVudGx5IHRo
ZQpyZWFzb24gd2h5IGl0J3MgZmFzdGVyLgo8L3ByZT4KICAgICAgICAgICAgICA8L2Jsb2NrcXVv
dGU+CiAgICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KVGhh
bmtzIGZvciB0aGUgZGV0YWlsZWQgaW5mbywgc28gdGhlIG9yaWdpbmFsIGNvZGUgc2tpcHMgdGlt
ZS1jb25zdW1pbmcKd29yayBpbnNpZGUgYXRvbWljIGNvbnRleHQgb24gcHVycG9zZS4gSXMgdGhl
cmUgYW55IHNwYWNlIHRvIG9wdG1pc2UgaXQ/CklmIDIgc2NoZWR1bGVkIHVwZGF0ZSB3b3JrZXIg
YXJlIGhhbmRsZWQgYXQgYWxtb3N0IHNhbWUgdGltZSwgY2FuIG9uZSBiZQpza2lwcGVkPwo8L3By
ZT4KICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgICAgICA8cHJlIGNsYXNzPSJtb3ot
cXVvdGUtcHJlIiB3cmFwPSIiPgpUbyBteSBrbm93bGVkZ2UsIHRoZXJlJ3Mgb25seSBvbmUgaW5z
dGFuY2Ugb2YgdGhlIHdvcmtlci4gUmUtc2NoZWR1bGluZwp0aGUgd29ya2VyIGJlZm9yZSBhIHBy
ZXZpb3VzIGluc3RhbmNlIHN0YXJ0ZWQsIHdpbGwgbm90IGNyZWF0ZSBhIHNlY29uZAppbnN0YW5j
ZS4gVGhlIHdvcmtlcidzIGluc3RhbmNlIHdpbGwgY29tcGxldGUgYWxsIHBlbmRpbmcgdXBkYXRl
cy4gU28gaW4Kc29tZSB3YXksIHNraXBwaW5nIHdvcmtlcnMgYWxyZWFkeSBoYXBwZW5zLgo8L3By
ZT4KICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+ClNvIEkgdGhpbmsgdGhhdCB0aGUgbW9zdCBvZnRlbiBmYmNvbiB1cGRh
dGUgZnJvbSBhdG9taWMgY29udGV4dCBpcyB0aGUKYmxpbmtpbmcgY3Vyc29yLiBJZiB5b3UgZGlz
YWJsZSB0aGF0IG9uZSB5b3Ugc2hvdWxkIGJlIGJhY2sgdG8gdGhlIG9sZApwZXJmb3JtYW5jZSBs
ZXZlbCBJIHRoaW5rLCBzaW5jZSBqdXN0IHdyaXRpbmcgdG8gZG1lc2cgaXMgZnJvbSBwcm9jZXNz
CmNvbnRleHQsIHNvIHNob3VsZG4ndCBjaGFuZ2UuCjwvcHJlPgogICAgICAgIDwvYmxvY2txdW90
ZT4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpIbW0sIHRoZW4g
Zm9yIHRoZSBvbGQgZHJpdmVyLCBpdCBzaG91bGQgYWxzbyBkbyB0aGUgbW9zdCB1cGRhdGUgaW4K
bm9uLWF0b21pYyBjb250ZXh0PyAKCk9uZSBvdGhlciB0aGluZyBpcywgSSBwcm9maWxlZCB0aGF0
IHVwZGF0aW5nIGEgM01CIHNoYWRvdyBidWZmZXIgbmVlZHMKMjAgbXMsIHdoaWNoIHRyYW5zZmVy
IHRvIDE1MCBNQi9zIGJhbmR3aWR0aC4gQ291bGQgaXQgYmUgcmVsYXRlZCB3aXRoCnRoZSBjYWNo
ZSBzZXR0aW5nIG9mIERSTSBzaGFkb3cgYnVmZmVyPyBzYXkgdGhlIG9yZ2luYWwgY29kZSB1c2Ug
YQpjYWNoYWJsZSBidWZmZXI/CgoKPC9wcmU+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgo8YSBjbGFz
cz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL3VuaXguc3RhY2tleGNoYW5n
ZS5jb20vcXVlc3Rpb25zLzM3NTkvaG93LXRvLXN0b3AtY3Vyc29yLWZyb20tYmxpbmtpbmciPmh0
dHBzOi8vdW5peC5zdGFja2V4Y2hhbmdlLmNvbS9xdWVzdGlvbnMvMzc1OS9ob3ctdG8tc3RvcC1j
dXJzb3ItZnJvbS1ibGlua2luZzwvYT4KCkJ1bmNoIG9mIHRyaWNrcywgYnV0IHRiaCBJIGhhdmVu
J3QgdGVzdGVkIHRoZW0uCjwvcHJlPgogICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICA8cHJl
IGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpUaG9tYXMgaGFzIHN1Z2dlc3RlZCB0byBk
aXNhYmxlIGN1cnNvbiBieQoJZWNobyAwICZndDsgL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZ3JhcGhp
Y3MvZmJjb24vY3Vyc29yX2JsaW5rCgpXZSB0cmllZCB0aGF0IHdheSwgYW5kIG5vIGNoYW5nZSBm
b3IgdGhlIHBlcmZvcm1hbmNlIGRhdGEuCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAg
IDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+ClRoZXJlIGFyZSBzZXZlcmFsIHdh
eXMgb2YgZGlzYWJsaW5nIHRoZSBjdXJzb3IuIE9uIG15IHRlc3Qgc3lzdGVtLCBJIGVudGVyZWQK
CiAgdHB1dCBjaXZpcwoKYmVmb3JlIHRoZSB0ZXN0IGFuZCBnb3QgYmV0dGVyIHBlcmZvcm1hbmNl
LiBEaWQgeW91IHRyeSB0aGlzIGFzIHdlbGw/PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8
YnI+CiAgICBUaGVyZSdzIG5vIG9idmlvdXMgY2hhbmdlIG9uIG91ciBzeXN0ZW0uPGJyPgogICAg
PGJyPgogICAgQmVzdCBSZWdhcmRzLDxicj4KICAgIFJvbmcgQ2hlbjxicj4KICAgIDxicj4KICAg
IDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1pZDozM2QzY2UxNS02MjIxLWJk
OTYtM2YyNi1iNzEwZTRkYTZiMWFAc3VzZS5kZSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+CgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo8L3ByZT4KICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3Jh
cD0iIj4KVGhhbmtzLApGZW5nCgo8L3ByZT4KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ij4KICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CkluIGFueSBj
YXNlLCBJIHN0aWxsIHN0cm9uZ2x5IGFkdmljZSB5b3UgZG9uJ3QgcHJpbnQgYW55dGhpbmcgdG8g
ZG1lc2cKb3IgZmJjb24gd2hpbGUgYmVuY2htYXJraW5nLCBiZWNhdXNlIGRtZXNnL3ByaW50ZiBh
cmUgYW55dGhpbmcgYnV0CmZhc3QsIGVzcGVjaWFsbHkgaWYgYSBncHUgZHJpdmVyIGlzIGludm9s
dmVkLiBUaGVyZSdzIHNvbWUgZWZmb3J0cyB0bwptYWtlIHRoZSBkbWVzZy9wcmludGsgc2lkZSBs
ZXNzIHBhaW5mdWwgKHVudGFuZ2xpbmcgdGhlIGNvbnNvbGVfbG9jawpmcm9tIHByaW50ayksIGJ1
dCBmdW5kYW1lbnRhbGx5IHByaW50aW5nIHRvIHRoZSBncHUgZnJvbSB0aGUga2VybmVsCnRocm91
Z2ggZG1lc2cvZmJjb24gd29uJ3QgYmUgY2hlYXAuIEl0J3MganVzdCBub3Qgc29tZXRoaW5nIHdl
Cm9wdGltaXplIGJleW9uZCAibWFrZSBzdXJlIGl0IHdvcmtzIGZvciBlbWVyZ2VuY2llcyIuCi1E
YW5pZWwKCjwvcHJlPgogICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAg
ICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CkJlc3QgcmVnYXJkcwpUaG9t
YXMKCjwvcHJlPgogICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAg
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpUaGFua3MsCkZlbmcKCjwv
cHJlPgogICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgICAg
ICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KQmVzdCByZWdhcmRzClRob21h
cwo8L3ByZT4KICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgPHByZSBj
bGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnIj5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPgo8YSBjbGFzcz0i
bW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbCI+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw8L2E+Cgo8L3ByZT4KICAgICAgICAgICAgPC9i
bG9ja3F1b3RlPgogICAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
PgotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgTGlu
dXggR21iSCwgTWF4ZmVsZHN0cmFzc2UgNSwgOTA0MDkgTnVlcm5iZXJnLCBHZXJtYW55CkdGOiBG
ZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaApIUkIgMjEyODQgKEFH
IE7DvHJuYmVyZykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZp
YXRlZCIgaHJlZj0ibWFpbHRvOmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmciPmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8L2E+CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJl
ZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsIj5odHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbDwvYT4KPC9wcmU+CiAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAg
ICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgoKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0
OCAtIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHA6Ly9ibG9nLmZm
d2xsLmNoIj5odHRwOi8vYmxvZy5mZndsbC5jaDwvYT4KPC9wcmU+CiAgICAgICAgPC9ibG9ja3F1
b3RlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+CjwvcHJlPgogICAgICA8YnI+CiAgICAgIDxmaWVsZHNldCBjbGFzcz0ibWltZUF0
dGFjaG1lbnRIZWFkZXIiPjwvZmllbGRzZXQ+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1w
cmUiIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTEtQIG1haWxpbmcgbGlzdAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBo
cmVmPSJtYWlsdG86TEtQQGxpc3RzLjAxLm9yZyI+TEtQQGxpc3RzLjAxLm9yZzwvYT4KPGEgY2xh
c3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFp
bG1hbi9saXN0aW5mby9sa3AiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8v
bGtwPC9hPgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICA8L2JvZHk+CjwvaHRt
bD4K

--===============0339014012761112351==--

