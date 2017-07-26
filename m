Content-Type: multipart/mixed; boundary="===============4671251309458061410=="
MIME-Version: 1.0
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 26 Jul 2017 09:57:50 -0400
Message-ID: <1501077470.28419.8.camel@linux.vnet.ibm.com>
In-Reply-To: <20170726030007.GA10087@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4671251309458061410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-25 at 22:00 -0500, Serge E. Hallyn wrote:
> On Fri, Jul 14, 2017 at 03:26:14PM -0400, Mimi Zohar wrote:
> > On Fri, 2017-07-14 at 13:17 -0500, Eric W. Biederman wrote:
> > > Which brings us to the semantic question of would it be nice to have
> > > stacked IMA/EVM on the same file.
> > > =

> > > I really don't think we do.  I think allowing multiple keys for
> > > different part of trusting files is easy enough that we should have no
> > > need to fight over which keys do which.
> > =

> > We definitely want to support different policies on the native and in
> > the namespace with different keys and keyrings.
> =

> Ok, so Stefan's code to support userspace in a container reading
> security.ima and getting back the value for security.ima(a)uid=3D1000
> (if 1000 is the kuid of the container's root user) is in fact
> useful to IMA?

Definitely! =C2=A0Root within the namespace needs to be able to read and
write security.ima in order to (re)sign files, with a specific key
known to that container. =C2=A0Stefan's code provides different views of
the security xattrs.

Mimi


--===============4671251309458061410==--

