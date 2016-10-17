Content-Type: multipart/mixed; boundary="===============4997712537673881759=="
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
To: lkp@lists.01.org
Subject: Re: [posix_acl] 073931017b: xfstests.generic.314.fail
Date: Mon, 17 Oct 2016 10:28:27 +0200
Message-ID: <CAHc6FU7UDE5axXQ5nV_raWEcAHLhXFsKsACWJ1J8Ddy9CRxa_A@mail.gmail.com>
In-Reply-To: <20161017082136.GC3359@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4997712537673881759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2016 at 10:21 AM, Jan Kara <jack@suse.cz> wrote:
> The changes in generic/092, generic/255, generic/316 look unrelated. Not
> sure how 0-day ended up blaming that commit (furthermore they don't
> reproduce for me locally). The change in generic/314 is known and
> deliberate. xfstests have been fixed up already AFAIK.

Here's the generic/314 report and fix for reference:

  https://marc.info/?l=3Dlinux-fsdevel&m=3D147622911827281&w=3D2
  https://marc.info/?l=3Dfstests&m=3D147630982119472&w=3D2

This doesn't show up on
"git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git master", yet.

Andreas

--===============4997712537673881759==--

