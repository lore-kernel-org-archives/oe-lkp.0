Content-Type: multipart/mixed; boundary="===============3815873792800055591=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 11:28:07 -0800
Message-ID: <CAHk-=wiNKLH2Pbnr9z2SvmDhf7XT==U6NPRkQNX13Sg-FRk0Yw@mail.gmail.com>
In-Reply-To: <20181203185954.GM31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3815873792800055591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 10:59 AM Michal Hocko <mhocko@kernel.org> wrote:
>
> You are misinterpreting my words. I haven't dismissed anything. I do
> recognize both usecases under discussion.
>
> I have merely said that a better THP locality needs more work and during
> the review discussion I have even volunteered to work on that.

We have two known patches that seem to have no real downsides.

One is the patch posted by Andrea earlier in this thread, which seems
to target just this known regression.

The other seems to be to revert commit ac5b2c1891  and instead apply

  https://lore.kernel.org/lkml/alpine.DEB.2.21.1810081303060.221006(a)chino=
.kir.corp.google.com/

which also seems to be sensible.

I'm not seeing why the KVM load would react badly to either of those
models, and they are known to fix the google local-node issue.

              Linus

--===============3815873792800055591==--

