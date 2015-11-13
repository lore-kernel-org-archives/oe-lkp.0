Content-Type: multipart/mixed; boundary="===============5488597907211918411=="
MIME-Version: 1.0
From: Seth Forshee <seth.forshee@canonical.com>
To: lkp@lists.01.org
Subject: Re: [loop] 1d5ab0e98c: BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
Date: Fri, 13 Nov 2015 07:08:15 -0600
Message-ID: <20151113130815.GA136440@ubuntu-hedt>
In-Reply-To: <20151113080632.GA7889@infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5488597907211918411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 12:06:32AM -0800, Christoph Hellwig wrote:
> Err, where the heck is a loop file system coming from?

I've been working on code to let some regular filesystems be mounted in
user namespace containers, and loopfs is an idea I'm playing with to
allow those containers to allocate and use loop devices (since they
can't mknod and devtmpfs isn't namepace aware). I'm not sure how I ended
up with the kbuild bot testing this code though, my tree doesn't feed
into linux-next or anything.

Seth

--===============5488597907211918411==--

