Content-Type: multipart/mixed; boundary="===============5108252667407324695=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [parallel lookups machinery, part 2] 96352435af: kernel BUG at mm/slab.c:2599!
Date: Mon, 18 Apr 2016 03:15:04 +0100
Message-ID: <20160418021504.GA25498@ZenIV.linux.org.uk>
In-Reply-To: <87mvorvfbu.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5108252667407324695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 10:08:37AM +0800, Huang, Ying wrote:

> Could you provide a debug branch in your tree for that?

Done - vfs.git#T1 and vfs.git#T2 resp.

How reproducible it is and how certain you are that it's not there on
the parent commit?

--===============5108252667407324695==--

