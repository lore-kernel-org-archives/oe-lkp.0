Content-Type: multipart/mixed; boundary="===============5965268362138147769=="
MIME-Version: 1.0
From: Vivek Goyal <vgoyal@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/3] Enable namespaced file capabilities
Date: Fri, 23 Jun 2017 16:09:56 -0400
Message-ID: <20170623200956.GB24779@redhat.com>
In-Reply-To: <1498157989-11814-1-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5965268362138147769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2017 at 02:59:46PM -0400, Stefan Berger wrote:
> This series of patches primary goal is to enable file capabilities
> in user namespaces without affecting the file capabilities that are
> effective on the host. This is to prevent that any unprivileged user
> on the host maps his own uid to root in a private namespace, writes
> the xattr, and executes the file with privilege on the host.
> =

> We achieve this goal by writing extended attributes with a different
> name when a user namespace is used. If for example the root user
> in a user namespace writes the security.capability xattr, the name
> of the xattr that is actually written is encoded as
> security.capability(a)uid=3D1000 for root mapped to uid 1000 on the host.
> When listing the xattrs on the host, the existing security.capability
> as well as the security.capability(a)uid=3D1000 will be shown. Inside the
> namespace only 'security.capability', with the value of
> security.capability(a)uid=3D1000, is visible.

Hi Stefan,

Got a question. If child usernamespace sets a
security.capability(a)uid=3D1000, can any of the parent namespace remove it?

IOW, I set capability from usernamespace and tried to remove it from
host and that failed. Is that expected.

# Inside usernamespce
$setcap cat_net_raw+ep foo.txt

# outside user namespace
$listxattr foo.txt
 xattr: security.capability(a)uid=3D1000
 xattr: security.selinux

# outside user namespace
setfattr -x security.capability(a)uid foo.txt
setfattr: foo.txt: Invalid argument

Doing a strace shows removexattr() failed. May this will need fixing?

removexattr("testfile.txt", "security.capability(a)uid") =3D -1 EINVAL
(Invalid argument)

Vivek

--===============5965268362138147769==--

