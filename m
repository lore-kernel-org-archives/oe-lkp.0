Content-Type: multipart/mixed; boundary="===============3958135385736539351=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 0/4] Fix softlockup when adding inotify watch
Date: Wed, 16 Feb 2022 21:37:03 +0800
Message-ID: <20220216133703.GB14084@xsang-OptiPlex-9020>
In-Reply-To: <85af9b13-24b6-a147-b7c4-9c64eb3b962c@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3958135385736539351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Feb 14, 2022 at 10:23:04PM -0800, Stephen Brennan wrote:
> Hi Oliver,
> =

> Thank you for re-running these! I had a tough time getting the tests runn=
ing
> on Oracle Linux or CentOS. More recently after sending this to you, I tri=
ed
> Debian, which seems to be the main distribution for the tests. It was qui=
te
> smooth to get the tests working on Debian. I reproduced the warning on my=
 v2
> patch series based on 5.16-rc2, but not 5.17 rc2+.
> =

> I was able to determine that the fix was 29044dae2e74 ("fsnotify: fix
> fsnotify hooks in pseudo filesystems") which is included in 5.17, which is
> why the warning no longer reproduces. From everything I've learned, NFS u=
sed
> a VFS method for deleting an in-memory file/dentry which is not ideal, and
> my patch merely surfaced a warning which may have been possible regardles=
s.
> After the fix I cannot reproduce the warning.
> =

> I appreciate your re-running the tests!

you are very welcome :) Thanks a lot for all these details!

> Thank you,
> Stephen
>=20
--===============3958135385736539351==--

