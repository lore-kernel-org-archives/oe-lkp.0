Content-Type: multipart/mixed; boundary="===============6969923138613723628=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Thu, 13 Jul 2017 19:38:30 -0500
Message-ID: <87h8yf7szd.fsf@xmission.com>
In-Reply-To: <9a3010e5-ca2b-5e7a-656b-fcc14f7bec4e@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6969923138613723628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Stefan Berger <stefanb@linux.vnet.ibm.com> writes:

> On 07/13/2017 01:49 PM, Eric W. Biederman wrote:
>
> > My big question right now is can you implement Ted's suggested
> > restriction.  Only one security.foo or secuirty.foo(a)... attribute ?

> We need to raw-list the xattrs and do the check before writing them. I am=
 fairly sure this can be done.
>
> So now you want to allow security.foo and one security.foo(a)uid=3D<> or =
just a single one security.foo(@[[:print:]]*)?
>

The latter.

Eric

--===============6969923138613723628==--

