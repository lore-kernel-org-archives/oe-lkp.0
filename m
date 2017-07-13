Content-Type: multipart/mixed; boundary="===============5666436531033376982=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Thu, 13 Jul 2017 17:35:22 -0400
Message-ID: <9a3010e5-ca2b-5e7a-656b-fcc14f7bec4e@linux.vnet.ibm.com>
In-Reply-To: <87bmoo8bxb.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5666436531033376982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/13/2017 01:49 PM, Eric W. Biederman wrote:
> Stefan Berger <stefanb@linux.vnet.ibm.com> writes:
>
>> On 07/13/2017 01:14 PM, Eric W. Biederman wrote:
>>> Theodore Ts'o <tytso@mit.edu> writes:
>>>
>>>> On Thu, Jul 13, 2017 at 07:11:36AM -0500, Eric W. Biederman wrote:
>>>>> The concise summary:
>>>>>
>>>>> Today we have the xattr security.capable that holds a set of
>>>>> capabilities that an application gains when executed.  AKA setuid roo=
t exec
>>>>> without actually being setuid root.
>>>>>
>>>>> User namespaces have the concept of capabilities that are not global =
but
>>>>> are limited to their user namespace.  We do not currently have
>>>>> filesystem support for this concept.
>>>> So correct me if I am wrong; in general, there will only be one
>>>> variant of the form:
>>>>
>>>>      security.foo(a)uid=3D15000
>>>>
>>>> It's not like there will be:
>>>>
>>>>      security.foo(a)uid=3D1000
>>>>      security.foo(a)uid=3D2000
>>>>
>>>> Except.... if you have an Distribution root directory which is shared
>>>> by many containers, you would need to put the xattrs in the overlay
>>>> inodes.  Worse, each time you launch a new container, with a new
>>>> subuid allocation, you will have to iterate over all files with
>>>> capabilities and do a copy-up operations on the xattrs in overlayfs.
>>>> So that's actually a bit of a disaster.
>>>>
>>>> So for distribution overlays, you will need to do things a different
>>>> way, which is to map the distro subdirectory so you know that the
>>>> capability with the global uid 0 should be used for the container
>>>> "root" uid, right?
>>>>
>>>> So this hack of using security.foo(a)uid=3D1000 is *only* useful when =
the
>>>> subcontainer root wants to create the privileged executable.  You
>>>> still have to do things the other way.
>>>>
>>>> So can we make perhaps the assertion that *either*:
>>>>
>>>>      security.foo
>>>>
>>>> exists, *or*
>>>>
>>>>      security.foo(a)uid=3DBAR
>>>>
>>>> exists, but never both?  And there BAR is exclusive to only one
>>>> instances?
>>>>
>>>> Otherwise, I suspect that the architecture is going to turn around and
>>>> bite us in the *ss eventually, because someone will want to do
>>>> something crazy and the solution will not be scalable.
>>> Yep.  That is what it looks like from here.
>>>
>>> Which is why I asked the question about scalability of the xattr
>>> implementations.  It looks like trying to accomodate the general
>>> case just gets us in trouble, and sets unrealistic expectations.
>>>
>>> Which strongly suggests that Serge's previous version that
>>> just reved the format of security.capable so that a uid field could
>>> be added is likely to be the better approach.
>>>
>>> I want to see what Serge and Stefan have to say but the case looks
>>> pretty clear cut at the moment.
>> The approach of virtualizing the xattrs on the name-side, which is
>> what this patch does, provides a more general approach than to
>> virtualizing it on the value side, which is what Serge does in his
>> other patch for security.capability alone. With the virtualizing
>> on-the-value side virtualizing the xattr becomes an exercise that
>> needs to be repeated for every xattr name that one would want to
>> virtualize. With this patch you would just add another xattr name to a
>> list, a one-line patch in the end. Xattr with prefixes like trusted.*
>> need a bit more work but this can be woven in as well
>> (https://github.com/stefanberger/linux/commit/397b1a3b24045c67405fc83465=
e544fc865d402f).
> Reusable code has merit, as it reduces the maintenance burden.
>
> My big question right now is can you implement Ted's suggested
> restriction.  Only one security.foo or secuirty.foo(a)... attribute ?

We need to raw-list the xattrs and do the check before writing them. I =

am fairly sure this can be done.

So now you want to allow security.foo *and one* security.foo(a)uid=3D<> or =

just a single one security.foo(@[[:print:]]*)?

    Stefan


--===============5666436531033376982==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9d2lu
ZG93cy0xMjUyIgogICAgICBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiPgogIDwvaGVhZD4KICA8
Ym9keSB0ZXh0PSIjMDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIDxkaXYgY2xhc3M9Im1v
ei1jaXRlLXByZWZpeCI+T24gMDcvMTMvMjAxNyAwMTo0OSBQTSwgRXJpYyBXLgogICAgICBCaWVk
ZXJtYW4gd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSBjaXRlPSJtaWQ6ODdi
bW9vOGJ4Yi5mc2ZAeG1pc3Npb24uY29tIiB0eXBlPSJjaXRlIj4KICAgICAgPHByZSB3cmFwPSIi
PlN0ZWZhbiBCZXJnZXIgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOnN0ZWZhbmJAbGludXgudm5ldC5pYm0uY29tIj4mbHQ7c3RlZmFuYkBsaW51eC52bmV0Lmli
bS5jb20mZ3Q7PC9hPiB3cml0ZXM6Cgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPk9uIDA3LzEzLzIwMTcgMDE6MTQgUE0sIEVyaWMgVy4g
QmllZGVybWFuIHdyb3RlOgo8L3ByZT4KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4K
ICAgICAgICAgIDxwcmUgd3JhcD0iIj5UaGVvZG9yZSBUcydvIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzp0eXRzb0BtaXQuZWR1Ij4mbHQ7dHl0c29AbWl0LmVk
dSZndDs8L2E+IHdyaXRlczoKCjwvcHJlPgogICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgICAgIDxwcmUgd3JhcD0iIj5PbiBUaHUsIEp1bCAxMywgMjAxNyBhdCAwNzox
MTozNkFNIC0wNTAwLCBFcmljIFcuIEJpZWRlcm1hbiB3cm90ZToKPC9wcmU+CiAgICAgICAgICAg
IDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgICAgIDxwcmUgd3JhcD0iIj5UaGUg
Y29uY2lzZSBzdW1tYXJ5OgoKVG9kYXkgd2UgaGF2ZSB0aGUgeGF0dHIgc2VjdXJpdHkuY2FwYWJs
ZSB0aGF0IGhvbGRzIGEgc2V0IG9mCmNhcGFiaWxpdGllcyB0aGF0IGFuIGFwcGxpY2F0aW9uIGdh
aW5zIHdoZW4gZXhlY3V0ZWQuICBBS0Egc2V0dWlkIHJvb3QgZXhlYwp3aXRob3V0IGFjdHVhbGx5
IGJlaW5nIHNldHVpZCByb290LgoKVXNlciBuYW1lc3BhY2VzIGhhdmUgdGhlIGNvbmNlcHQgb2Yg
Y2FwYWJpbGl0aWVzIHRoYXQgYXJlIG5vdCBnbG9iYWwgYnV0CmFyZSBsaW1pdGVkIHRvIHRoZWly
IHVzZXIgbmFtZXNwYWNlLiAgV2UgZG8gbm90IGN1cnJlbnRseSBoYXZlCmZpbGVzeXN0ZW0gc3Vw
cG9ydCBmb3IgdGhpcyBjb25jZXB0Lgo8L3ByZT4KICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgog
ICAgICAgICAgICA8cHJlIHdyYXA9IiI+U28gY29ycmVjdCBtZSBpZiBJIGFtIHdyb25nOyBpbiBn
ZW5lcmFsLCB0aGVyZSB3aWxsIG9ubHkgYmUgb25lCnZhcmlhbnQgb2YgdGhlIGZvcm06CgogICAg
c2VjdXJpdHkuZm9vQHVpZD0xNTAwMAoKSXQncyBub3QgbGlrZSB0aGVyZSB3aWxsIGJlOgoKICAg
IHNlY3VyaXR5LmZvb0B1aWQ9MTAwMAogICAgc2VjdXJpdHkuZm9vQHVpZD0yMDAwCgpFeGNlcHQu
Li4uIGlmIHlvdSBoYXZlIGFuIERpc3RyaWJ1dGlvbiByb290IGRpcmVjdG9yeSB3aGljaCBpcyBz
aGFyZWQKYnkgbWFueSBjb250YWluZXJzLCB5b3Ugd291bGQgbmVlZCB0byBwdXQgdGhlIHhhdHRy
cyBpbiB0aGUgb3ZlcmxheQppbm9kZXMuICBXb3JzZSwgZWFjaCB0aW1lIHlvdSBsYXVuY2ggYSBu
ZXcgY29udGFpbmVyLCB3aXRoIGEgbmV3CnN1YnVpZCBhbGxvY2F0aW9uLCB5b3Ugd2lsbCBoYXZl
IHRvIGl0ZXJhdGUgb3ZlciBhbGwgZmlsZXMgd2l0aApjYXBhYmlsaXRpZXMgYW5kIGRvIGEgY29w
eS11cCBvcGVyYXRpb25zIG9uIHRoZSB4YXR0cnMgaW4gb3ZlcmxheWZzLgpTbyB0aGF0J3MgYWN0
dWFsbHkgYSBiaXQgb2YgYSBkaXNhc3Rlci4KClNvIGZvciBkaXN0cmlidXRpb24gb3ZlcmxheXMs
IHlvdSB3aWxsIG5lZWQgdG8gZG8gdGhpbmdzIGEgZGlmZmVyZW50CndheSwgd2hpY2ggaXMgdG8g
bWFwIHRoZSBkaXN0cm8gc3ViZGlyZWN0b3J5IHNvIHlvdSBrbm93IHRoYXQgdGhlCmNhcGFiaWxp
dHkgd2l0aCB0aGUgZ2xvYmFsIHVpZCAwIHNob3VsZCBiZSB1c2VkIGZvciB0aGUgY29udGFpbmVy
CiJyb290IiB1aWQsIHJpZ2h0PwoKU28gdGhpcyBoYWNrIG9mIHVzaW5nIHNlY3VyaXR5LmZvb0B1
aWQ9MTAwMCBpcyAqb25seSogdXNlZnVsIHdoZW4gdGhlCnN1YmNvbnRhaW5lciByb290IHdhbnRz
IHRvIGNyZWF0ZSB0aGUgcHJpdmlsZWdlZCBleGVjdXRhYmxlLiAgWW91CnN0aWxsIGhhdmUgdG8g
ZG8gdGhpbmdzIHRoZSBvdGhlciB3YXkuCgpTbyBjYW4gd2UgbWFrZSBwZXJoYXBzIHRoZSBhc3Nl
cnRpb24gdGhhdCAqZWl0aGVyKjoKCiAgICBzZWN1cml0eS5mb28KCmV4aXN0cywgKm9yKgoKICAg
IHNlY3VyaXR5LmZvb0B1aWQ9QkFSCgpleGlzdHMsIGJ1dCBuZXZlciBib3RoPyAgQW5kIHRoZXJl
IEJBUiBpcyBleGNsdXNpdmUgdG8gb25seSBvbmUKaW5zdGFuY2VzPwoKT3RoZXJ3aXNlLCBJIHN1
c3BlY3QgdGhhdCB0aGUgYXJjaGl0ZWN0dXJlIGlzIGdvaW5nIHRvIHR1cm4gYXJvdW5kIGFuZApi
aXRlIHVzIGluIHRoZSAqc3MgZXZlbnR1YWxseSwgYmVjYXVzZSBzb21lb25lIHdpbGwgd2FudCB0
byBkbwpzb21ldGhpbmcgY3JhenkgYW5kIHRoZSBzb2x1dGlvbiB3aWxsIG5vdCBiZSBzY2FsYWJs
ZS4KPC9wcmU+CiAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICA8cHJlIHdyYXA9IiI+
WWVwLiAgVGhhdCBpcyB3aGF0IGl0IGxvb2tzIGxpa2UgZnJvbSBoZXJlLgoKV2hpY2ggaXMgd2h5
IEkgYXNrZWQgdGhlIHF1ZXN0aW9uIGFib3V0IHNjYWxhYmlsaXR5IG9mIHRoZSB4YXR0cgppbXBs
ZW1lbnRhdGlvbnMuICBJdCBsb29rcyBsaWtlIHRyeWluZyB0byBhY2NvbW9kYXRlIHRoZSBnZW5l
cmFsCmNhc2UganVzdCBnZXRzIHVzIGluIHRyb3VibGUsIGFuZCBzZXRzIHVucmVhbGlzdGljIGV4
cGVjdGF0aW9ucy4KCldoaWNoIHN0cm9uZ2x5IHN1Z2dlc3RzIHRoYXQgU2VyZ2UncyBwcmV2aW91
cyB2ZXJzaW9uIHRoYXQKanVzdCByZXZlZCB0aGUgZm9ybWF0IG9mIHNlY3VyaXR5LmNhcGFibGUg
c28gdGhhdCBhIHVpZCBmaWVsZCBjb3VsZApiZSBhZGRlZCBpcyBsaWtlbHkgdG8gYmUgdGhlIGJl
dHRlciBhcHByb2FjaC4KCkkgd2FudCB0byBzZWUgd2hhdCBTZXJnZSBhbmQgU3RlZmFuIGhhdmUg
dG8gc2F5IGJ1dCB0aGUgY2FzZSBsb29rcwpwcmV0dHkgY2xlYXIgY3V0IGF0IHRoZSBtb21lbnQu
CjwvcHJlPgogICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICA8cHJlIHdyYXA9IiI+ClRoZSBh
cHByb2FjaCBvZiB2aXJ0dWFsaXppbmcgdGhlIHhhdHRycyBvbiB0aGUgbmFtZS1zaWRlLCB3aGlj
aCBpcwp3aGF0IHRoaXMgcGF0Y2ggZG9lcywgcHJvdmlkZXMgYSBtb3JlIGdlbmVyYWwgYXBwcm9h
Y2ggdGhhbiB0bwp2aXJ0dWFsaXppbmcgaXQgb24gdGhlIHZhbHVlIHNpZGUsIHdoaWNoIGlzIHdo
YXQgU2VyZ2UgZG9lcyBpbiBoaXMKb3RoZXIgcGF0Y2ggZm9yIHNlY3VyaXR5LmNhcGFiaWxpdHkg
YWxvbmUuIFdpdGggdGhlIHZpcnR1YWxpemluZwpvbi10aGUtdmFsdWUgc2lkZSB2aXJ0dWFsaXpp
bmcgdGhlIHhhdHRyIGJlY29tZXMgYW4gZXhlcmNpc2UgdGhhdApuZWVkcyB0byBiZSByZXBlYXRl
ZCBmb3IgZXZlcnkgeGF0dHIgbmFtZSB0aGF0IG9uZSB3b3VsZCB3YW50IHRvCnZpcnR1YWxpemUu
IFdpdGggdGhpcyBwYXRjaCB5b3Ugd291bGQganVzdCBhZGQgYW5vdGhlciB4YXR0ciBuYW1lIHRv
IGEKbGlzdCwgYSBvbmUtbGluZSBwYXRjaCBpbiB0aGUgZW5kLiBYYXR0ciB3aXRoIHByZWZpeGVz
IGxpa2UgdHJ1c3RlZC4qCm5lZWQgYSBiaXQgbW9yZSB3b3JrIGJ1dCB0aGlzIGNhbiBiZSB3b3Zl
biBpbiBhcyB3ZWxsCig8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vc3RlZmFuYmVyZ2VyL2xpbnV4L2NvbW1pdC8zOTdiMWEzYjI0MDQ1YzY3
NDA1ZmM4MzQ2NWU1NDRmYzg2NWQ0MDJmIj5odHRwczovL2dpdGh1Yi5jb20vc3RlZmFuYmVyZ2Vy
L2xpbnV4L2NvbW1pdC8zOTdiMWEzYjI0MDQ1YzY3NDA1ZmM4MzQ2NWU1NDRmYzg2NWQ0MDJmPC9h
PikuCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0iIj4KUmV1c2Fi
bGUgY29kZSBoYXMgbWVyaXQsIGFzIGl0IHJlZHVjZXMgdGhlIG1haW50ZW5hbmNlIGJ1cmRlbi4K
Ck15IGJpZyBxdWVzdGlvbiByaWdodCBub3cgaXMgY2FuIHlvdSBpbXBsZW1lbnQgVGVkJ3Mgc3Vn
Z2VzdGVkCnJlc3RyaWN0aW9uLiAgT25seSBvbmUgc2VjdXJpdHkuZm9vIG9yIHNlY3VpcnR5LmZv
b0AuLi4gYXR0cmlidXRlID88L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICAgIFdl
IG5lZWQgdG8gcmF3LWxpc3QgdGhlIHhhdHRycyBhbmQgZG8gdGhlIGNoZWNrIGJlZm9yZSB3cml0
aW5nIHRoZW0uCiAgICBJIGFtIGZhaXJseSBzdXJlIHRoaXMgY2FuIGJlIGRvbmUuPGJyPgogICAg
PGJyPgogICAgU28gbm93IHlvdSB3YW50IHRvIGFsbG93IHNlY3VyaXR5LmZvbyA8Yj5hbmQgb25l
PC9iPgogICAgc2VjdXJpdHkuZm9vQHVpZD0mbHQ7Jmd0OyBvciBqdXN0IGEgc2luZ2xlIG9uZQog
ICAgc2VjdXJpdHkuZm9vKEBbWzpwcmludDpdXSopPzxicj4KICAgIDxicj4KICAgIKCgIFN0ZWZh
bjxicj4KICAgIDxicj4KICA8L2JvZHk+CjwvaHRtbD4K

--===============5666436531033376982==--

