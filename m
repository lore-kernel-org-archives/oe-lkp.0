Content-Type: multipart/mixed; boundary="===============0100376935041685905=="
MIME-Version: 1.0
From: Theodore Y. Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Fri, 21 May 2021 12:42:16 -0400
Message-ID: <YKfi6Pv+qwduKxuT@mit.edu>
In-Reply-To: <20210521092730.GE18952@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0100376935041685905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 11:27:30AM +0200, Jan Kara wrote:
> =

> OK, thanks for testing. So the orphan code is indeed the likely cause of
> this regression but I probably did not guess correctly what is the
> contention point there. Then I guess I need to reproduce and do more
> digging why the contention happens...

Hmm... what if we only recalculate the superblock checksum when we do
a commit, via the callback function from the jbd2 layer to file
system?

					- Ted
--===============0100376935041685905==--

