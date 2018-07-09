Content-Type: multipart/mixed; boundary="===============4074535506023830295=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [shmem] a067b3644b: vm-scalability.throughput -73.2% regression
Date: Sun, 08 Jul 2018 18:10:26 -0700
Message-ID: <20180709011026.GA11700@bombadil.infradead.org>
In-Reply-To: <20180704062532.GC10005@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4074535506023830295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2018 at 02:25:32PM +0800, Ye Xiaolong wrote:
> Hi, Matthew
> =

> The issue should be fixed now, could you have a try?

I could really use some help diagnosing this.  Is there a way to ssh
into the lkp virtual machine while it's running, or boot it to a command
prompt, or something else I can use to (eg) run strace?

When I boot the same kernel with the ktest system (which I do know how to
ssh into), running usemem with the same parameters successfully forks four
tasks.  So I'm a little stuck.

--===============4074535506023830295==--

