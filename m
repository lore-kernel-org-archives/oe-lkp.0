Content-Type: multipart/mixed; boundary="===============6811901346906971750=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: __might_sleep() warnings on v3.19-rc6
Date: Sun, 01 Feb 2015 21:08:12 -0800
Message-ID: <CA+55aFyR-ZK9Y2KkxbcTnMOcCc243ZKD6AKTuktpmyE0HCUcPw@mail.gmail.com>
In-Reply-To: <20150202100338.4fa9eefa@notabene.brown>
List-Id: <oe-lkp.lists.linux.dev>

--===============6811901346906971750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2015 at 3:03 PM, NeilBrown <neilb@suse.de> wrote:
>
> I guess I could
>       __set_current_state(TASK_RUNNING);
> somewhere to defeat the warning, and add a comment explaining why.
>
> Would that be a good thing?

Use "sched_annotate_sleep()" instead, but yes, add a comment about why it's=
 ok.

                        Linus

--===============6811901346906971750==--

