Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD52C75B
	for <oe-lkp@lists.linux.dev>; Wed, 17 May 2023 14:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2443EC4339C;
	Wed, 17 May 2023 14:14:20 +0000 (UTC)
Date: Wed, 17 May 2023 10:14:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: yujie.liu@intel.com, amakhalov@vmware.com, chinglinyu@google.com,
 er.ajay.kaher@gmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 lkp@intel.com, mhiramat@kernel.org, namit@vmware.com,
 oe-lkp@lists.linux.dev, shuah@kernel.org, srivatsa@csail.mit.edu,
 srivatsab@vmware.com, tkundu@vmware.com, vsirnapalli@vmware.com
Subject: Re: [PATCH v2 8/9] eventfs: moving tracing/events to eventfs
Message-ID: <20230517101418.1e4a347d@gandalf.local.home>
In-Reply-To: <1684327207-19817-1-git-send-email-akaher@vmware.com>
References: <202305051619.9a469a9a-yujie.liu@intel.com>
	<1684327207-19817-1-git-send-email-akaher@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 May 2023 18:10:07 +0530
Ajay Kaher <akaher@vmware.com> wrote:

> Steve, locally I have reproduced this issue using:
>     lkp run job-cpu-100%-uprobe-60s.yaml
> 
> And also fixed, I will include this fix as well in v3.

Great. Thanks Ajay!

-- Steve
