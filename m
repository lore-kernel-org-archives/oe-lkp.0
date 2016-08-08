Content-Type: multipart/mixed; boundary="===============5907605639272076873=="
MIME-Version: 1.0
From: Chris Mason <clm@fb.com>
To: lkp@lists.01.org
Subject: Re: [dm flakey] 99f3c90d0d: WARNING: CPU: 20 PID: 1027 at fs/btrfs/extent-tree.c:2973 btrfs_run_delayed_refs+0x2c5/0x2f0 [btrfs]
Date: Mon, 08 Aug 2016 17:02:13 -0400
Message-ID: <652374b9-1457-0409-b5eb-b253efb7d5fd@fb.com>
In-Reply-To: <CA+55aFzFFKaTMfDUmrV5QvLq0PsmmNrRYqVOLLujyQq7oa4Nkg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5907605639272076873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/08/2016 02:27 PM, Linus Torvalds wrote:
> This report should probably have gone to the btrfs people, although it
> doesn't really look like a bug.
>
> It looks like it's just dm-flakey now returning more errors, and
> causing btrfs to complain more.
>
> Which seems entirely expected.
>
> Maybe the robot just was testing a error case that didn't actually
> happen before.

Yeah, this warning in btrfs is much too verbose.  I've been meaning to =

toss it under a debugging conditional because it makes common hardware =

problems look like software problems.  It also spams dmesg during xfstests.

Thanks, I've been meaning to fix it up.

-chris

--===============5907605639272076873==--

