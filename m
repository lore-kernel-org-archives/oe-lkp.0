Content-Type: multipart/mixed; boundary="===============4021957666523254159=="
MIME-Version: 1.0
From: Vivek Goyal <vgoyal@redhat.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [xattr] 6e21a50861: ltp.setxattr02.fail
Date: Tue, 07 Sep 2021 13:52:22 -0400
Message-ID: <YTem1rCPHsgoohkp@redhat.com>
In-Reply-To: <YTXNXOKbrl17Lx+s@yuki>
List-Id: <oe-lkp.lists.linux.dev>

--===============4021957666523254159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 10:12:12AM +0200, Cyril Hrubis wrote:
> Hi!
> > commit: 6e21a5086100cebefd21a3058a9e1160668f84fa ("xattr: Allow user.* =
xattr on symlink and special files")
> > https://github.com/rhvgoyal/linux user-xattr-symlink-v3
> =

> The test that fails is a test that asserts that you can't add extended
> attributes to a block or char device and it's obvious why this fails.
> =

> Feel free to ignore this failure, we will have to fix the tests once/if
> this patchset gets accepted upstream.

Yes, if patches get accepted, test will have to be fixed. I fixed
xfstest too in the same patch series.

But at the moment it looks like there is resistance to the idea of
allowing user.* xattrs on symlinks and special files.

Vivek

> =

> -- =

> Cyril Hrubis
> chrubis(a)suse.cz
>=20

--===============4021957666523254159==--

