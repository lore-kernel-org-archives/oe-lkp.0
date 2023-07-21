Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58928200AE
	for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 19:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5461BC433CA;
	Fri, 21 Jul 2023 19:14:13 +0000 (UTC)
Date: Fri, 21 Jul 2023 15:14:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: "shuah@kernel.org" <shuah@kernel.org>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, Ching-lin Yu <chinglinyu@google.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, lkp@intel.com, Nadav Amit
 <namit@vmware.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
 Alexey Makhalov <amakhalov@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "srivatsa@csail.mit.edu"
 <srivatsa@csail.mit.edu>, Tapas Kundu <tkundu@vmware.com>, Vasavi
 Sirnapalli <vsirnapalli@vmware.com>
Subject: Re: [PATCH v4 00/10] tracing: introducing eventfs
Message-ID: <20230721151409.212791c0@gandalf.local.home>
In-Reply-To: <20230721091843.68c4d6e7@gandalf.local.home>
References: <1689248004-8158-1-git-send-email-akaher@vmware.com>
	<20230714185824.62556254@gandalf.local.home>
	<883F9774-3E76-4346-9988-2788FAF0D55E@vmware.com>
	<20230718094005.32516161@gandalf.local.home>
	<2CD72098-08E2-4CAA-B74D-D8C44D318117@vmware.com>
	<20230719102310.552d3356@gandalf.local.home>
	<899D0823-A1B2-4A6F-A5BA-0D707F41C3D4@vmware.com>
	<20230719144046.746af82e@gandalf.local.home>
	<20230721091843.68c4d6e7@gandalf.local.home>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Jul 2023 09:18:43 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> OK, I got this working and it appears to pass all my tests. I actually got
> it working Wednesday night, but I tried a different approach on Thursday
> that got rid of the evenfs_file and only used eventfs_inodes and makes the
> files more dynamic. There's still a couple of corner cases that are not
> working with this approach (the dentry counters are getting out of sync).
> This should not stop this from going in. I'll continue working on that
> approach for the next merge cycle. But for now, here's the patch to this
> series that works.

Just figured out my bug with my new design. It was in the eventfs_release()
code, where I have a loop that does the dput on the children, but I wasn't
dput(child), I was dput(parent) in that loop!!

Anyway, for this merge window I much rather have this code in, and for the
next merge window I'll add this update.

I can post the new design too, but first let's focus on this.

-- Steve
