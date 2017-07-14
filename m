Content-Type: multipart/mixed; boundary="===============8625817921337177290=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 07:04:19 -0500
Message-ID: <87vamv2pj0.fsf@xmission.com>
In-Reply-To: <65dbe654-0d99-03fa-c838-5a726b462826@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8625817921337177290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Stefan Berger <stefanb@linux.vnet.ibm.com> writes:

> On 07/13/2017 08:38 PM, Eric W. Biederman wrote:
>> Stefan Berger <stefanb@linux.vnet.ibm.com> writes:
>>
>>> On 07/13/2017 01:49 PM, Eric W. Biederman wrote:
>>>
>>>> My big question right now is can you implement Ted's suggested
>>>> restriction.  Only one security.foo or secuirty.foo(a)... attribute ?
>>> We need to raw-list the xattrs and do the check before writing them. I =
am fairly sure this can be done.
>>>
>>> So now you want to allow security.foo and one security.foo(a)uid=3D<> o=
r just a single one security.foo(@[[:print:]]*)?
>>>
>> The latter.
>
> That case would prevent a container user from overriding the xattr on
> the host. Is that what we want?

Most definitely.  If a more privileged use has set secure.capable that
is better.  =


> For limiting the number of xattrs and
> getting that functionality (override IMA signature for example) the
> former seems better...

I don't know about IMA.  But my feeling is that we will only be dealing
with a single signing key, so I don't see how having multiple IMA xattrs
make sense.  Could you explain that to me?

> For the former I now have the topmost patch here:
> https://github.com/stefanberger/linux/commits/xattr_for_userns.v3

Thank you.

Eric


--===============8625817921337177290==--

