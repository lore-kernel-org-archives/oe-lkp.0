Content-Type: multipart/mixed; boundary="===============5308314598407888217=="
MIME-Version: 1.0
From: zhengbin (A) <zhengbin13@huawei.com>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Thu, 19 Sep 2019 12:16:13 +0800
Message-ID: <0e928266-c290-eae0-5988-389d077626f6@huawei.com>
In-Reply-To: <20190919035531.GL1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5308314598407888217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2019/9/19 11:55, Al Viro wrote:
> On Thu, Sep 19, 2019 at 11:36:28AM +0800, zhengbin (A) wrote:
>
>>>> + dput(to);
>>>> dput(to) should be in if if (file->f_pos > 2)? cause we dget(to) in sc=
an_positives
>>> dput(NULL) is a no-op
>> +=C2=A0=C2=A0=C2=A0 spin_unlock(&dentry->d_lock);
>> +=C2=A0=C2=A0=C2=A0 dput(*res);
>> +=C2=A0=C2=A0=C2=A0 *res =3D found;
>> +=C2=A0=C2=A0=C2=A0 return p;
>>
>> dput(*res) should be removed?
> Huh?  Why would it?  We drop the original reference and replace it with t=
he
> new one; what's the problem?

You are right, I miss the key point in dcache_readdir.

And I test this patch for 2 hours, it is OK. no oops, I will test it for mo=
re time.

>
> .
>

--===============5308314598407888217==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGRpdiBj
bGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAyMDE5LzkvMTkgMTE6NTUsIEFsIFZpcm8gd3JvdGU6
PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJt
aWQ6MjAxOTA5MTkwMzU1MzEuR0wxMTMxQFplbklWLmxpbnV4Lm9yZy51ayI+CiAgICAgIDxwcmUg
Y2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTE6
MzY6MjhBTSArMDgwMCwgemhlbmdiaW4gKEEpIHdyb3RlOgoKPC9wcmU+CiAgICAgIDxibG9ja3F1
b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAg
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1x
dW90ZS1wcmUiIHdyYXA9IiI+KyBkcHV0KHRvKTsKZHB1dCh0bykgc2hvdWxkIGJlIGluIGlmIGlm
IChmaWxlLSZndDtmX3BvcyAmZ3Q7IDIpPyBjYXVzZSB3ZSBkZ2V0KHRvKSBpbiBzY2FuX3Bvc2l0
aXZlcwo8L3ByZT4KICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgIDxwcmUgY2xhc3M9
Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+ZHB1dChOVUxMKSBpcyBhIG5vLW9wCjwvcHJlPgogICAg
ICAgIDwvYmxvY2txdW90ZT4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFw
PSIiPgorwqDCoMKgIHNwaW5fdW5sb2NrKCZhbXA7ZGVudHJ5LSZndDtkX2xvY2spOworwqDCoMKg
IGRwdXQoKnJlcyk7CivCoMKgwqAgKnJlcyA9IGZvdW5kOworwqDCoMKgIHJldHVybiBwOwoKZHB1
dCgqcmVzKSBzaG91bGQgYmUgcmVtb3ZlZD8KPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAg
ICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KSHVoPyAgV2h5IHdvdWxkIGl0
PyAgV2UgZHJvcCB0aGUgb3JpZ2luYWwgcmVmZXJlbmNlIGFuZCByZXBsYWNlIGl0IHdpdGggdGhl
Cm5ldyBvbmU7IHdoYXQncyB0aGUgcHJvYmxlbT88L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAg
IDxwPllvdSBhcmUgcmlnaHQsIEkgbWlzcyB0aGUga2V5IHBvaW50IGluIGRjYWNoZV9yZWFkZGly
Ljxicj4KICAgIDwvcD4KICAgIDxwPkFuZCBJIHRlc3QgdGhpcyBwYXRjaCBmb3IgMiBob3Vycywg
aXQgaXMgT0suIG5vIG9vcHMsIEkgd2lsbCB0ZXN0CiAgICAgIGl0IGZvciBtb3JlIHRpbWUuPHNw
YW4gc3R5bGU9ImNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IGZvbnQtZmFtaWx5OiBtb25vc3BhY2U7
IGZvbnQtc2l6ZTogMTMuMzMzM3B4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1s
aWdhdHVyZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6
IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3Rh
cnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTog
cHJlOyB3aWRvd3M6IDI7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdp
ZHRoOiAwcHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgdGV4dC1kZWNv
cmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6IGluaXRpYWw7IGRp
c3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPjwvc3Bhbj48L3A+CiAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAxOTA5MTkwMzU1MzEuR0wx
MTMxQFplbklWLmxpbnV4Lm9yZy51ayI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+CgouCgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICA8L2JvZHk+CjwvaHRtbD4K

--===============5308314598407888217==--

