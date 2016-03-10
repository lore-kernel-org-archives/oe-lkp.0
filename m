Content-Type: multipart/mixed; boundary="===============7645115539633557332=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: Please add git tree
Date: Thu, 10 Mar 2016 10:40:48 -0500
Message-ID: <20160310154048.GH2464@linux.intel.com>
In-Reply-To: <20160307050153.GA29296@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7645115539633557332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2016 at 01:01:53PM +0800, Philip Li wrote:
> On Sun, Mar 06, 2016 at 10:06:42PM -0500, Matthew Wilcox wrote:
> > =

> > Please add
> > =

> > git://git.infradead.org/users/willy/linux-dax.git
> =

> sure, this is added, and build status will be notified.

I found some build errors in this tree.  Is it possible that 0day is
failing to test some x86-32 configs?

Combinations of Kconfig symbols that I want to see tested:

64BIT
X86_PAE
HIGHMEM
HIGHMEM4G
HIGHMEM64G
NOHIGHMEM
TRANSPARENT_HUGEPAGE
DAX

(some of these interact with each other in fun ways, so it's fewer than
2^8 different configs)

Is there a way to see what configs were tested against a particular
branch?  I'd also like to know whether pSeries was tested.


--===============7645115539633557332==--

