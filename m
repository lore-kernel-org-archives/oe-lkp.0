Content-Type: multipart/mixed; boundary="===============1059365764773041364=="
MIME-Version: 1.0
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/3] Enable namespaced file capabilities
Date: Thu, 22 Jun 2017 16:29:21 -0700
Message-ID: <1498174161.7636.4.camel@HansenPartnership.com>
In-Reply-To: <1498157989-11814-1-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1059365764773041364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-22 at 14:59 -0400, Stefan Berger wrote:
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

I'm a bit bothered by the @uid=3D1000 suffix.  What if I want to use this
capability but am dynamically mapping the namespaces (i.e. I know I
want unprivileged root, but I'm going to dynamically select the range
to map based on what's currently available on the orchestration
system).  If we stick with the @uid=3DX suffix, then dynamic mapping
won't work because X is potentially different each time and there'll be
a name mismatch in my xattrs.  Why not just make the suffix @uid, which
means if root is mapped to any unprivileged uid then we pick this up
otherwise we go with the unsuffixed property?

As far as I can see there's no real advantage to discriminating userns
specific xattrs based on where root is mapped to, unless there's a use
case I'm missing?

James



--===============1059365764773041364==--

