Content-Type: multipart/mixed; boundary="===============2663026969115722803=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: linux-next: a new pending-fixes branch
Date: Fri, 18 May 2018 06:46:26 +1000
Message-ID: <20180518064626.3f79e30f@canb.auug.org.au>
In-Reply-To: <20180517174247.GI8514@sasha-vm>
List-Id: <oe-lkp.lists.linux.dev>

--===============2663026969115722803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

On Thu, 17 May 2018 17:42:49 +0000 Sasha Levin <Alexander.Levin@microsoft=
.com> wrote:
>
> On Sat, May 12, 2018 at 02:35:23PM +1000, Stephen Rothwell wrote:
> >Hi all,
> >
> >As an outcome of some discussion, I have added a pending-fixes branch
> >to linux-next.  This branch contains Linus' tree merged with branches
> >containing only fixes pending for the current release.  The branch is a
> >strict subset of linux-next each day (as so rebases like linux-next
> >does).  =

> =

> will you be keeping a history of this branch like the linux-next history
> tree?

I hadn't intended to.  Do you think it would be useful/necessary?  The
commits themselves will be in the linux-next history tree, just not a
separate branch name.

-- =

Cheers,
Stephen Rothwell

--===============2663026969115722803==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVOSUM5NmdpWjgx
dFdkTGdLQVZCQzgwbFgwR3dGQWxyOTZpSUFDZ2tRQVZCQzgwbFgKMEd5UTBBZi9iM0RDNkYzcytB
L2VwTUpCTFdXdmtvWDMwMHFLejZxL05oOEZyRXpQRXRXMkpIZ0wrd2w2OWtsNgorcXltR3hINXNj
MVZYaXhvbjBQQXY4aXI4UFRIVHh3Y2dxS2w2aUJJUG1waWdyb0hiWTRRQ1BLVUZTYURRZkZQCmRo
ZTNwU2o3QnJ4TTU2NlI5am8zOWN0Mk1RK0VDdk5PUXRDdDBBdGEveEtxRkthZzhMN3BRaGR3WnBa
cFJJNzYKdGU3U2U2UGxqa3lzc2oyeVdYeldGV0dWWUUzYi81Z2wwajF5cVNpUnE2VTdvaHcwRXpi
NmVBdUhnTUZOQTFOTwpCWXJQQXdQakJBRG5zQ0QyT1lwamMrWW1XaUhOT2RoYkhHb2VDNDhGTHZH
aW9rVFgyaXQ4M2xhK2VJcndLKzJwCkh2b3JDeTJzSUZ2eGxwcVNRK0xEd3lrblNOamQ2QT09Cj10
OHJQCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============2663026969115722803==--

