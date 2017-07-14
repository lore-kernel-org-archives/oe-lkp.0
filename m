Content-Type: multipart/mixed; boundary="===============8553179991223597609=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 07:32:42 -0400
Message-ID: <65dbe654-0d99-03fa-c838-5a726b462826@linux.vnet.ibm.com>
In-Reply-To: <87h8yf7szd.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8553179991223597609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/13/2017 08:38 PM, Eric W. Biederman wrote:
> Stefan Berger <stefanb@linux.vnet.ibm.com> writes:
>
>> On 07/13/2017 01:49 PM, Eric W. Biederman wrote:
>>
>>> My big question right now is can you implement Ted's suggested
>>> restriction.  Only one security.foo or secuirty.foo(a)... attribute ?
>> We need to raw-list the xattrs and do the check before writing them. I a=
m fairly sure this can be done.
>>
>> So now you want to allow security.foo and one security.foo(a)uid=3D<> or=
 just a single one security.foo(@[[:print:]]*)?
>>
> The latter.

That case would prevent a container user from overriding the xattr on =

the host. Is that what we want? For limiting the number of xattrs and =

getting that functionality (override IMA signature for example) the =

former seems better...

For the former I now have the topmost patch here: =

https://github.com/stefanberger/linux/commits/xattr_for_userns.v3

    Stefan


>
> Eric
> --
> To unsubscribe from this list: send the line "unsubscribe linux-security-=
module" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--===============8553179991223597609==--

