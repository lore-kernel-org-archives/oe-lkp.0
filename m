Content-Type: multipart/mixed; boundary="===============2321129031628955971=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@suse.com>
To: lkp@lists.01.org
Subject: Re: [Xen-devel] [PATCH v3 0/7] Enhance PAT init to fix Xorg crashes
Date: Wed, 30 Mar 2016 13:47:26 -0700
Message-ID: <CAB=NE6Wuc9Jy=CS_bGTE20MhBX95EMnrR6TZJ0tineEEo6yRgg@mail.gmail.com>
In-Reply-To: <20160330202920.GB23916@char.us.oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2321129031628955971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 1:29 PM, Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
> On Wed, Mar 30, 2016 at 01:10:29PM -0700, Luis R. Rodriguez wrote:
>
> Are you saying that you expect Xen maintainers to _NOT_ test Xen related
> patches? Especially ones they have been involved with?

Of course not, I'm saying we have a bottleneck on development if we
need to wait for Xen patches to be tested, and we can do better if we
had 0-day testing this for us. In this case it was *me* who brought up
the issue of a Xen conflict early, and later through other iterations
Toshi addressed this, given we have the technology and bandwidth to do
more testing with 0-day we should not have to count on me or others to
do the proactive review to ensure there is no Xen conflict, or on
Boris for final confirmation. Its a nobrainer the value of integration
of Xen with 0-day.

>> If its really trivial then you give me the impression you can help
>> with its integration. 0-day is open after all.
>
> I have no clue on how the 0-day works - hence my question. I would be mor=
e than
> happy to help once free time lines up.

Great.

  Luis

--===============2321129031628955971==--

