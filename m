Content-Type: multipart/mixed; boundary="===============6092500008053337262=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [torture] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 30 Sep 2014 19:41:38 +0800
Message-ID: <20140930114138.GA3974@wfg-t540p.sh.intel.com>
In-Reply-To: <20140930095842.GR5015@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6092500008053337262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

> One thing would be something like this:
> =

> 	( sleep 300; rmmod rcutorture ) &
> =

> Running both locktorture and rcutorture concurrently is not supported
> at the moment because both make the assumption that they have the entire
> system at their disposal.

It's good to know that! Following your instructions, I just added 2
test cases for rcutorture and locktorture in LKP. :)

Thanks,
Fengguang

--===============6092500008053337262==--

