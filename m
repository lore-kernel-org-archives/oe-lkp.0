Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE877134B5
	for <oe-lkp@lists.linux.dev>; Thu, 30 Nov 2023 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="S1sdqEiO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2eIWjuIhqmVk8xKXkSIoxQ/LjUg3fvZYc/KvlVrGF6M=; b=S1sdqEiOkM3l/NQpRyFQccHCgl
	1QNfXqBwtBQavzZ+WATlHGz784Rl6O6x9691v3cQ+SA4iulj3pXGM4sMXTGl28VTUEGMst76voiEA
	9p3q9SL5iEPzWkLc82bPoBA1Pr13cvOyDtVApmQVzQINN4HeMa3lxUOTOQ3pP3KHbwmCokyb6e95S
	naIkWQeAr430h1JclsAxwUn4/0tnfwzq+ZqukkAUCO5lqoqSAKbBs/1t0e2+Jj82Wo+SxMpxsj9TJ
	Yri9hcb6cmHmRl0nvT2H4+xz66ozCY4ZZCIrehwVNOG7O+D69O0KO2oqdipv25mRAgWE8xX8RmIZB
	91IdWvKg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r8btX-005INn-2p;
	Thu, 30 Nov 2023 07:55:35 +0000
Date: Thu, 30 Nov 2023 07:55:35 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()]  1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
Message-ID: <20231130075535.GN38156@ZenIV>
References: <202311300906.1f989fa8-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311300906.1f989fa8-oliver.sang@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Nov 30, 2023 at 12:54:01PM +0800, kernel test robot wrote:

> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231130/202311300906.1f989fa8-oliver.sang@intel.com
> 
> =========================================================================================
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp7/sysinfo/stress-ng/60s
> 
> commit: 
>   e3640d37d0 ("d_prune_aliases(): use a shrink list")
>   1b738f196e ("__dentry_kill(): new locking scheme")

Very interesting...  Out of curiosity, what effect would the following
have on top of 1b738f196e?

diff --git a/fs/dcache.c b/fs/dcache.c
index b212a65ed190..d4a95e690771 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1053,16 +1053,14 @@ void d_prune_aliases(struct inode *inode)
 }
 EXPORT_SYMBOL(d_prune_aliases);
 
-static inline void shrink_kill(struct dentry *victim)
+static inline void shrink_kill(struct dentry *victim, struct list_head *list)
 {
-	do {
-		rcu_read_unlock();
-		victim = __dentry_kill(victim);
-		rcu_read_lock();
-	} while (victim && lock_for_kill(victim));
 	rcu_read_unlock();
-	if (victim)
+	victim = __dentry_kill(victim);
+	if (victim) {
+		to_shrink_list(victim, list);
 		spin_unlock(&victim->d_lock);
+	}
 }
 
 void shrink_dentry_list(struct list_head *list)
@@ -1084,7 +1082,7 @@ void shrink_dentry_list(struct list_head *list)
 			continue;
 		}
 		d_shrink_del(dentry);
-		shrink_kill(dentry);
+		shrink_kill(dentry, list);
 	}
 }
 
@@ -1514,7 +1512,7 @@ void shrink_dcache_parent(struct dentry *parent)
 				spin_unlock(&data.victim->d_lock);
 				rcu_read_unlock();
 			} else {
-				shrink_kill(data.victim);
+				shrink_kill(data.victim, &data.dispose);
 			}
 		}
 		if (!list_empty(&data.dispose))
