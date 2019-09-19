Content-Type: multipart/mixed; boundary="===============3418667972914247392=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Thu, 19 Sep 2019 04:55:31 +0100
Message-ID: <20190919035531.GL1131@ZenIV.linux.org.uk>
In-Reply-To: <c79495de-9f51-4e9b-97e1-0f98a147cd8a@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3418667972914247392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 11:36:28AM +0800, zhengbin (A) wrote:

> >> + dput(to);
> >> dput(to) should be in if if (file->f_pos > 2)? cause we dget(to) in sc=
an_positives
> > dput(NULL) is a no-op
> =

> +=C2=A0=C2=A0=C2=A0 spin_unlock(&dentry->d_lock);
> +=C2=A0=C2=A0=C2=A0 dput(*res);
> +=C2=A0=C2=A0=C2=A0 *res =3D found;
> +=C2=A0=C2=A0=C2=A0 return p;
> =

> dput(*res) should be removed?

Huh?  Why would it?  We drop the original reference and replace it with the
new one; what's the problem?

--===============3418667972914247392==--

